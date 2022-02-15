class CommentsController < ApplicationController
  
  def index
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.gossip_id = params[:gossip_id]
    @comment.user_id = User.all.sample.id

    @comment.save
  
    redirect_to gossip_path(@comment.gossip)
  end
  end

  def show
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
