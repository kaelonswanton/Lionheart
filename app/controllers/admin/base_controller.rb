class Admin::BaseController < ApplicationController

  before_action :authenticate_user!
  before_action :admin?

  private
  def admin?
    unless current_user.admin?
      redirect_to root_path, errror: "You are not authorized to view this page"
    end
  end
end
