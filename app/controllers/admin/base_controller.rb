class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin

  protected

  def verify_admin
    redirect_to root_path unless current_user.admin?
  end

end
