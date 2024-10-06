class Admin::PostCommentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @post_comments = PostComment.all
  end

  def destroy
    @post_comment = PostComment.find_by_id(params[:id])
    @post_comment.destroy if @post_comment
    flash[:notice] = "削除しました。"
    redirect_to admin_post_comments_path
  end
end
