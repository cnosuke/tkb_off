class UserController < ApplicationController
  def index
    @participants = User.all
  end
end
