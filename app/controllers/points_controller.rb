class PointsController < ApplicationController



  # 投稿データの保存


def
 point
end



  def edit
    @point = Point.find(params[:id])
     unless @point.user.id == current_user.id
     redirect_to points_path
     end
  end
  
  def create
    @point = Point.new(point_params)
    @point.user_id = current_user.id
if  @point.save
      flash[:notice] = "You have created point successfully."
      redirect_to point_path(@point.id)
else
      @points = Point.all
      render :show
      @user = current_user
      
      
end
  end

  def update
     @point = Point.find(params[:id])
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
      @post_comment = PostComment.new  # @post_commentに値を代入している部分
    end

  def destroy
      point = Point.find(params[:id])
      point.destroy
      redirect_to points_path
  end

  private

  def 
  point_params
  params.fetch(:point, {}).permit(:title, :body)
  end
end
