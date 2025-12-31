class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]

  # GET /movies or /movies.json
  def index
    if params[:date].present? && params[:title].present?
      @pagy, @movies = pagy(Movie.search(params[:title]).filter_days(params[:date]).order(ratings_average: :desc), items: 20)
    elsif params[:date].present? 
      @pagy, @movies = pagy(Movie.filter_days(params[:date]).order(ratings_average: :desc), items: 20)
    elsif params[:title].present?
      @pagy, @movies = pagy(Movie.search(params[:title]).order(ratings_average: :desc), items: 20)
    else
      @pagy, @movies = pagy(Movie.order(ratings_average: :desc), items: 20)
    end
  end

  # GET /movies/1 or /movies/1.json
  def show
    @ratings_count = @movie.ratings.group(:score).count
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit; end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_path, status: :see_other, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movie_params
    params.require(:movie).permit(:name, :release_date, :director, :actor, :image)
  end
end
