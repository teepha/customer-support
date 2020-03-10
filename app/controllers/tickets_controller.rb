# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :update_status]

  def index
    unless current_user.is_agent? || current_user.is_admin?
      return @tickets = current_user.tickets.order('created_at DESC')
    end
    @tickets = Ticket.all.order('created_at DESC')
  end

  def closed_tickets
    @tickets = Ticket.tickets_closed_within_a_month
    get_zip_data(@tickets)
  end

  def new
    @ticket = Ticket.new
  end

  def create
    unless current_user.is_agent?
      @ticket = current_user.tickets.new(ticket_params)
    end
    if @ticket.save
      flash[:success] = 'Ticket was successfully created!'
      redirect_to ticket_path(@ticket)
    else
      flash[:error] = @ticket.errors.full_messages[0].to_s
      render :new
    end
  end

  def show
    return redirect_to tickets_path unless @ticket

    unless is_mine?(@ticket) || current_user.is_agent? || current_user.is_admin?
      flash[:error] = 'Unauthorized request!'
      redirect_to tickets_path
    end
    @comments = @ticket.comments
  end

  def update_status
    if @ticket.open?
      @ticket.closed!
      flash[:success] = "Ticket status was successfully updated!" 
    end
    redirect_to @ticket
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Sorry, record not found!'
  end

  def create_zip_folder(folder_name, report_data)
    file_name = "#{folder_name}.zip"
    ::Zip::File.open(file_name, Zip::File::CREATE) do |zipfile|
      report_data.each do |csv_file_name, report|
        zipfile.get_output_stream("#{csv_file_name}.csv") do |file|
          file.write report
        end
      end
    end
    file_name
  end

  def get_zip_data(data)
    file_name = create_zip_folder("tickets_report_csv", data)
    File.open(file_name, "r") do |file|
      send_data(file.read, type: "application/zip", filename: file_name,
                           disposition: "attachment")
    end
    File.delete(file_name)
  end
end
