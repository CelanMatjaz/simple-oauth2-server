class AdminController < ApplicationController
  def index
    @users = User.all
    @applications = Application.all
  end
end
