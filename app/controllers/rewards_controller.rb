class RewardsController < ApplicationController
  before_action :load_project

  def new
    @reward = Reward.new
  end

  def create
    @reward = @project.rewards.build
    @reward.dollar_amount = params[:reward][:dollar_amount]
    @reward.description = params[:reward][:description]
    @reward.amount = params[:reward][:amount]

    if @reward.save
      redirect_to project_url(@project), notice: 'Reward created'
    else
      render :new
    end
  end
  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.find(params[:id])
    @project = Project.find(params[:project_id])

    if current_user.id == @project.user_id
      @reward.dollar_amount = params[:reward][:dollar_amount]
      @reward.description = params[:reward][:description]
      @reward.amount = params[:reward][:amount]
    else
      if @reward.amount > @reward.claimed
           @reward.claimed += 1
      end
    end
    

    if @reward.save
      redirect_to project_url(@project), notice: 'Reward Updated'
    else
      render :edit
    end
  end


  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy

    redirect_to project_url(@project), notice: 'Reward successfully removed'
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end
end
