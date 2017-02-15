class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  before_action :user_logged_in
  WillPaginate.per_page = 4

  def user_logged_in
    unless logged_in?
      store_location
      redirect_to login_path
    end
  end

 def admin_user
      redirect_to(artists_path) unless current_user.admin?
    end
end
