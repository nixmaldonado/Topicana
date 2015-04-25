class TopicsController < ApplicationController


  before_action :authenticate_user!, except: [:show, :index]

  def create
    if current_user.admin?
      @topic = Topic.create(topic_params)
      redirect_to topics_path
    else
      redirect_to topics_path
    end
  end


  def new
    @topic = Topic.new
  end

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @comment = @topic.comments.new
  end

  private

  def topic_params
    params.require(:topic).permit(:body, :title)
  end

end

