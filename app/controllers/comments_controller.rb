class CommentsController < ApplicationController
  before_action :set_movie

  def index
    @comments = @movie.comments
  end
   
  def create
    @comment = @movie.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to movie_path(@movie), notice: "posted successfully"
    else 
      redirect_to movie_path(@movie), alert: "something went wrong"
    end 
  end

  def edit
    @comment = @movie.comments.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @comment = @movie.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to movie_path(@movie), notice: "updated successfully"
    else
      redirect_to movie_path(@movie), alert: "something went wrong"
    end
  end
  
  def destroy
    @comment = @movie.comments.find(params[:id])
    @comment.destroy 
    redirect_to movie_comments_path(@movie), notice: "destroyed successfully"
  end

  private 
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end