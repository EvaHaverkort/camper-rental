class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home # skip authentication

  def home
  end

  def contacts
  end

  def profile
    @user = current_user
  end
end
