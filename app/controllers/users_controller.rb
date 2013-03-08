class UsersController < ApplicationController
  def index
    @participants = User.all
  end

  def regist
    @user = current_user
  end

  def create
    @user = current_user
    @user.update_attributes({
                                     :real_name => params["real_name"],
                                     :unit => params["unit"],
                                     :student_num => params["student_num"],
                                     :comment => params["comment"],
                                     :message => params["message"]
                                   })
  end

end
