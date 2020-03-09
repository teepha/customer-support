class Comment < ApplicationRecord
  validates_presence_of :body, :user_id, :ticket_id

  belongs_to :user
  belongs_to :ticket
end
