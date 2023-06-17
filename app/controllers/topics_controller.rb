class TopicsController < ApplicationController
  
  helper_method :favorite_counter, :load_comments, :find_comment_user
  
  def index
    @topics = Topic.all.includes(:favorites, :favorite_users)
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to topics_path,success: '投稿に成功しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end
  
  def favorite_counter(topic)
    return Favorite.where(topic_id: topic.id).count
  end
  
  def load_comments(topic_id)
    Comment.where(topic_id: topic_id)
  end
  
  def find_comment_user(user_id)
    user = User.find_by(id: user_id)
    user.name
  end
  
  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
  
end
