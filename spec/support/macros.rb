def set_current_user(user=nil)
  session[:user_id] = (user || Fabricate(:user)).id
end

# def sign_in(a_user=nil)
#   user = a_user || Fabricate(:user)
#   visit sign_in_path
#   fill_in "Email Address", with: user.email
#   fill_in "passowrd", with: user.password
#   click_button "Sign in"
# end
#
# def sign_out
#   visit sign_out_path
# end
