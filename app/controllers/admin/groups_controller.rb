class Admin::GroupsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @groups = Group.all
  end

  def destroy
    @group = Group.find_by_id(params[:id])
    @group.destroy if @group
    flash[:notice] = "削除しました。"
    redirect_to admin_groups_path
  end
end
