class RatingsController < ApplicationController
  before_action :set_movie
  def create
    @rating = @movie.ratings.new(rating_params)
    @rating.user_id = current_user.id
    if @rating.save
      redirect_to movie_path(@movie), notice: 'Rating is successfully'
    else
      redirect_to movie_path(@movie), alert: 'something went wrong'
    end
  end

  def update
    @rating = @movie.ratings.find(params[:id])
    if @rating.update(rating_params)
      redirect_to movie_path(@movie), notice: 'Rating is updated'
    else
      redirect_to movie_path(@movie), alert: 'something went wrong'
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
