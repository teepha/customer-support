class CommentsController < ApplicationController
  before_action :set_ticket

  def create
    @comment = current_user.comments.new({
      ticket_id: params[:ticket_id],
      body: params[:comment][:body]
    })

    if @comment.save
      redirect_to @ticket
    else
      flash[:error] = @comment.errors.full_messages[0].to_s
      redirect_to @ticket
    end
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end
end
