class ChangeTicketDescriptionToText < ActiveRecord::Migration[6.0]
  def change
    change_column :tickets, :description, :text
  end
end
