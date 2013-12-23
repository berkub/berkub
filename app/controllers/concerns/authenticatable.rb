module Authenticatable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :user_logged_in?

    class NotAuthorizedError < StandardError; end
    rescue_from NotAuthorizedError, with: :user_not_authorized
  end

  def url_after_signup
    root_path
  end

  def url_after_login
    root_url
  end

  def url_after_logout
    root_url
  end

  def user_logged_in?
    current_user.present?
  end

  def login_as(user)
    session[:user_id] = user.try(:id)
  end

  # TODO: should store current url and redirect to that,
  # once the user is logged in.
  def authenticate_user!
    raise NotAuthorizedError unless user_logged_in?
  end

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_not_authorized
    redirect_to login_path
  end
end