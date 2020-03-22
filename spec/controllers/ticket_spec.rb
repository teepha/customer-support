require "rails_helper"

RSpec.describe TicketController do
  let(:user) { build :user }
  let(:valid_attributes) { attributes_for(:user) }

  describe 'POST /tickets' do
    context 'when valid request' do
      it "renders new user template" do
        get :new, {}
        expect(response).to render_template(:new)
      end
    end
  end
end
