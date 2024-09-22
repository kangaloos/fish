class PostImagesController < ApplicationController




  def show
    @point = Point.find(params[:id])
    @post_comment = PostComment
  end


end