# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]

  # GET /movies or /movies.json
  def index
    if params[:search]
      @filter = params[:search][:category]
      @movies = Movie.where(category: @filter).paginate(page: params[:page], per_page: 4)
    else
      @movies = Movie.all.paginate(page: params[:page], per_page: 4)
    end
  end

  # GET /movies/1 or /movies/1.json
  def show
    if current_user
      @user_rating = current_user.ratings.find_by(movie: @movie).rate
    end  
    @average_rating = @movie.average_rating
    
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
        format.html { redirect_to movie_url(@movie), notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    @movie.ratings.find_or_create_by(user: current_user).update(rate: params[:movie][:rating])

    redirect_to movies_url
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
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
    params.require(:movie).permit(:title, :description, :category, :poster)
  end
end
