class CommentsController < ApplicationController

  def index
      @fortune = Fortune.find(params[:fortune])
      @comments = @fortune.comments.all
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
      format.json { render :json => @comments }
      format.atom
    end

  end


  def create
    if(current_user)
      @fortune = Fortune.find(params[:fortune_id])
      @comment = Comment.new(:fortune => @fortune, :user => current_user, :body => params[:comment][:body])
      @comment.save
      respond_with(@fortune, @comment, :location => @fortune)
    else
      respond_with(Fortune.find(params[:fortune_id]))
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @fortune = @comment.fortune
    @comment.destroy
    respond_with(@fortune, @comment, :location => @fortune)
  end
end
