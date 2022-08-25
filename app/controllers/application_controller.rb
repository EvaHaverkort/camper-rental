class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit::Authorization

  def configure_permitted_parameters # call this in a before action!!
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :user_type])
  end

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^pages$)/
    # || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end

  # by default devise knows it needs email and passowrd
  # devise_parameter_sanitizer is a helper that lets you set extra values
  # different method/helper from the params permit

  # before_action :authenticate_user! #, :except => [:show, :index] # but I only want this for offers, not bookings
  # include Pundit::Authorization # tell it to always check who is logged in and what their role is
  # protect every page by default
  # where did we do that thing on Monday where we manually change a value to true or false


  # pundit needs to be called on content, it checks if certain content is accessible, so it's always after an action
  # if you don't put anything it will always run at the end of your action. Application policy: determines what happens
  # if you don't authorize.

  # all the controllers methods need the authorize @object  OR policy scope

  # you call authorize if it is one object to authorize
  # you call policy scope if the object has more instances
  # you can use policy scope more specific too, you can say that you only want to give access to the content of
  # a method if the user matches a certain value.
