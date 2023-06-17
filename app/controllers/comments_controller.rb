class CommentsController < ApplicationController
  def index
    
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    
    if @comment.save
      redirect_to topics_path,success: '投稿に成功しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      puts @comment.errors.full_messages
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, topic_id: params[:topic_id])
  end
end
