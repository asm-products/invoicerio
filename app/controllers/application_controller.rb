class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :user_has_company?, if: -> { signed_in? }, :except => [:new_company, :create_company]

  def user_has_company?
    if current_user.company == nil
      redirect_to new_user_company_path
    end
  end
end
