class TopicsController < ApplicationController
  before_action :authenticate_user!
  #before_action :verify_admin!, only: :create
  def create
    @topic = Topic.create(topic_params)
    redirect_to topics_path
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

