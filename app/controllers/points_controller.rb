class PointsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
  end

  def edit

  end

  def create
    @point = Point.new(point_params)
    @point.user_id = current_user.id
    if@point.save
      flash[:notice] = "You have created point successfully."
      redirect_to point_path(@point.id)
    else
      @points = Point.all
      render :show
      @user = current_user
    end
  end

  def update
    if @point.update(point_params)
       flash[:notice] = "You have updated point successfully"
       redirect_to point_path(@point.id)
    else
       render :edit
    end
  end

  def index
    @points = Point.all
    @point  = Point.new
  end

  def show
    @point = Point.find(params[:id])
    @user = @point.user
    @newpoint = Point.new
    @point = Point.find(params[:id])
    @post_comment = PostComment.new  
  end

  def destroy
    @point.destroy
    redirect_to points_path
  end

  private

  def point_params
    params.fetch(:point, {}).permit(:title, :body)
  end

  def correct_user
    @point = current_user.points.find_by_id(params[:id])
    unless @point
      redirect_to root_path
    end
  end
end
