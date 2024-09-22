class PostCommentsController < ApplicationController
  
  def create
    point = Point.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.point_id = point.id
    comment.save
    redirect_to point_path(point)
  end
  
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end

