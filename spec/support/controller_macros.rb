module ControllerMacros
  def login_admin
    before(:all) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = FactoryBot.create(:admin)
      sign_in :user, admin
    end
  end

  def login_user
    before(:all) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end
end
