class ChangeTicketStatusToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :tickets, :status, :integer, default: 0
  end
end
