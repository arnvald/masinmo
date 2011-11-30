# encoding: utf-8

class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment].merge({:user_id => current_user.id, :offer_id => params[:offer_id]}))
    if @comment.save
      flash[:notice] = "Comment added"
    else
      flash[:error] = "We're sorry, your comment couldn't be added"
    end
    redirect_to offer_path(params[:offer_id])
  end

  def delete
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment deleted"
    else
      flash[:error] = "Comment couldn't be deleted"
    end
    redirect_to offer_path(params[:offer_id])
  end


end
