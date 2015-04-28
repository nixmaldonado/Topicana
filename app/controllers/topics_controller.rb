class TopicsController < ApplicationController


  before_action :authenticate_user!, except: [:show, :index]
  before_action :get_current_topic, only: [:show, :fav, :unfav]

  def index
    @topics = Topic.all
  end

  def show
    @comment = @topic.comments.new
  end

  def fav
    current_user.fav_topic!(@topic)
    redirect_to topic_path(@topic), notice: "Topic is now favorite"
  end

  def unfav
    current_user.unfav_topic!(@topic)
    redirect_to topic_path(@topic), notice: "Topic is no longer favorite"
  end

  private

  def topic_params
    params.require(:topic).permit(:body, :title)
  end

  def get_current_topic
    @topic = Topic.find(params[:id])
  end


end

