class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :html, :json, :xml

  def require_user
    redirect_to sign_in_path unless current_user
  end

  def after_sign_up_path_for(resource)
    edit_user_path(@user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end




end
