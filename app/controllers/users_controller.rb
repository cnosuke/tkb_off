class UsersController < ApplicationController
  def index
    @participants = User.all
    @user = current_user
    @regist_flag = session[:regist]
    session[:regist] = nil
  end

  def regist
    session[:regist] = true
    redirect_to root_path
  end

  def create
    @user = current_user
    session[:regist] = nil
    u = params[:user]
    if @user.update_attributes!({
                                     :real_name => u["real_name"],
                                     :unit => u["unit"],
                                     :student_num => u["student_num"],
                                     :comment => u["comment"],
                                     :message => u["message"]
                                   })
    then
      redirect_to root_path
    else
      raise ArgumentError
    end

  end

end
