class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def verify_admin
    unless current_user.admin?
    redirect_to root_path, notice: "You are not an admin!"
    end
  end

end
