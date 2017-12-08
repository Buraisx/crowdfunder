class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create
  #v2 attempt by omair 
  validates_numericality_of :start_date, :greater_than => :created_at
  #v3 attempt by omair
  validates_numericality_of :end_date, :greater_than => :start_date
  #v4 attempt by omair
   validates_numericality_of :goal, :greater_than => 0

  require :
  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new
    @project.title = params[:project][:title]
    @project.description = params[:project][:description]
    @project.goal = params[:project][:goal]
    @project.start_date = params[:project][:start_date]
    @project.end_date = params[:project][:end_date]
    @project.image = params[:project][:image]

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
   end

end
