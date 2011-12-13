# encoding: utf-8

class CommentsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_comment, :only => [:destroy]
  before_filter :check_admin, :only => [:destroy]

  def create
    @comment = Comment.new(params[:comment].merge({:user_id => current_user.id, :offer_id => params[:offer_id]}))
    if @comment.save
      flash[:notice] = "Comment added"
    else
      flash[:error] = "We're sorry, your comment couldn't be added"
    end
    redirect_to offer_path(@comment.offer)
  end

  def destroy
    if @comment.destroy
      flash[:notice] = "Comment deleted"
    else
      flash[:error] = "Comment couldn't be deleted"
    end
    redirect_to offer_path(@comment.offer)
  end

  private
  def find_comment
    @comment = Comment.find(params[:id])
  end

  def check_admin
    return true if current_user.admin?
    flash[:notice] = "Only admin can do it"
    redirect_to offer_path(@comment.offer)
  end

end
