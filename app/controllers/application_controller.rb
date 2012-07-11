class ApplicationController < ActionController::Base
  include CommentsPathHelper
  include OpengraphHelper

  protect_from_forgery

  before_filter :set_current_user

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: "Leider darfst du das nicht."
  end

  private

  def set_current_user
    User.current = current_user
  end

end
