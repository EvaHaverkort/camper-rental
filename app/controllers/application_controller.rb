class ApplicationController < ActionController::Base
  before_action :authenticate_user! #, :except => [:show, :index] # but I only want this for offers, not bookings
  #protect every page by default
  # where did we do that thing on Monday where we manually change a value to true or false

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
  # by default devise knows it needs email and passowrd
  # devise_parameter_sanitizer is a helper that lets you set extra values
  # different method/helper from the params permit

end
