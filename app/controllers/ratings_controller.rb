class RatingsController < ApplicationController
  before_action :set_movie
  def create
    @rating = @movie.ratings.new(rating_params)
    if @rating.save 
      redirect_to movie_path(@movie), notice: "Rating is successfully"
    else 
      redirect_to movie_path(@movie), alert: "something went wrong"
    end
  end

  private 

  def set_movie 
    @movie = Movie.find(params[:movie_id])
  end


  def rating_params
    params.require(:rating).permit(:score)
  end
end
