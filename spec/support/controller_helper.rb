module ControllerExampleGroupMethods
  def it_behaves_like_a_devise_controller
    before :each do
      request.env["devise.mapping"] = Devise.mappings[:user]
    end
  end
end
