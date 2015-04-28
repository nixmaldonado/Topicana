class Admin::TopicsController < Admin::BaseController

  before_action :set_topic, only: [:show, :edit, :update, :destroy]


  def index
    @topics = Topic.all
  end

  def show; end

  def new
    @topic = current_user.topics.build
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, notice: "Topic created master!"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @topic.update(topic_params)
      redirect_to topics_path
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path
  end

  protected

    def topic_params
      params.require(:topic).permit(:body, :title)
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

end
