class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_back(fallback_location: root_path)
  end
  
  def create
     @post_comment = @post.post_comments.new(comment_params) 
     if @post_comment.save
       redirect_to @post
     else
       # エラー処理
     end
  end

   private
   def comment_params
     params.require(:post_comment).permit(:comment)
   end

 private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end