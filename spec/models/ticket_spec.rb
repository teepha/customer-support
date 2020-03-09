require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe "Associations" do
    it{ should belong_to(:user) }
    it{ should have_many(:comments) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:description) }
  end
end
