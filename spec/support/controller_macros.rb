module ControllerMacros
  # def login_admin
  #   before(:each) do
  #     @request.env['devise.mapping'] = Devise.mappings[:admin]
  #     sign_in FactoryBot.create(:admin) # Using factory bot as an example
  #   end
  # end

  # NOTE: If your admin factory is nested on your user factory, you'll need to call sign_in like this:
  # def login_admin
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:admin]
  #     admin = FactoryBot.create(:admin)
  #     sign_in :user, admin # sign_in(scope, resource)
  #   end
  # end

  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end
end
