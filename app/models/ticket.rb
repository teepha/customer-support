class Ticket < ApplicationRecord
  enum status: {open: 0, closed: 1}

  validates_presence_of :title, :description
  validates :user_id, presence: true

  belongs_to :user
  has_many :comments
end
