class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.gossip_id = params[:gossip_id]
    @comment.save
    redirect_to gossip_path(@comment.gossip)
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Le commentaire a été supprimé."
    redirect_to gossip_path(@gossip)
  end

  def comment_params
    params.require(:comment).permit(:content, :author)
  end

end
