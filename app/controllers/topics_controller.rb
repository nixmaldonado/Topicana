class TopicsController < ApplicationController


  before_action :authenticate_user!, except: [:show, :index]

  def create
    if current_user.admin?
      @topic = current_user.topics.create(topic_params)

      redirect_to topics_path, notice: "Topic created master!"
      unless @topic.save
        redirect_to topics_path notice: "Topic not created!"
      end
    else
      redirect_to topics_path, notice: "You must be admin to create Topics!"
    end
  end


  def new
    @topic = current_user.topics.build
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

