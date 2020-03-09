require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Associations" do
    it{ should belong_to(:user) }
    it{ should belong_to(:ticket) }
  end

  describe "Validations" do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:ticket_id) }
  end
end
