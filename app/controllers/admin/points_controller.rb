class Admin::PointsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @points = Point.all
  end

  def destroy
    @point = Point.find_by_id(params[:id])
    @point.destroy if @point
    flash[:notice] = "削除しました。"
    redirect_to admin_points_path
  end
end
