class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id]) 
    @projects = Project.where(user_id: params[:id])
    @pledges = Pledge.where(user_id: params[:id])

    @total_pledged = 0
    @pledges.each do |pledge|
      @total_pledged += pledge.dollar_amount
    end
  end

  def create
    @user = User.new
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      auto_login(@user)
      redirect_to projects_url
    else
      render 'new'
    end
  end
end
