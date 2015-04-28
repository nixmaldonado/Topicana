class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :get_current_topic
  before_action :get_current_comment, only: [:flag, :unflag]


  def create
    @comment          = current_user.comments.new(comment_params)
    @comment.topic_id = @topic.id
    @comment.save
    redirect_to topic_path(@topic)
  end



  def new
    @comment = current_user.comments.new
  end

  def flag
    current_user.flag_comment!(@comment)
    redirect_to topic_path(@topic), notice: "Comment Flagged as inappropriate"
  end

  def unflag
    current_user.unflag_comment!(@comment)
    redirect_to topic_path(@topic), notice: "Comment Unflagged"
  end

private

def get_current_comment
  @comment = Comment.find(params[:id])
end

def get_current_topic
    @topic = Topic.find(params[:topic_id])
end

def comment_params
  params.require(:comment).permit(:body)
end

end
