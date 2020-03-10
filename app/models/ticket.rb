class Ticket < ApplicationRecord
  enum status: {open: 0, closed: 1}

  validates_presence_of :title, :description
  validates :user_id, presence: true

  belongs_to :user
  has_many :comments

  def self.tickets_closed_within_a_month
    where('status =? AND updated_at >= NOW() - INTERVAL 30 DAY', 1)
  end
end
