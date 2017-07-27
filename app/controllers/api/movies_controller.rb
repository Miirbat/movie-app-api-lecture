class Api::MoviesController < ApplicationController 
  def index 
    @movies = Movie.all 
    render json: @movies
  end

  def create 
    @movie = Movie.new(movie_params)
    if @movie.save 
      render json: @movie 
    else 
      render json: { errors: { message: "This Movie Failed To Save" }}
    end 
  end

  def destroy 
    @movie = Movie.find_by(id: params[:id])
    if @movie && @movie.destroy 
      render status: 204
    else 
      render json: { errors: "Unable to delete this movie" }
    end 
  end

  private 
    def movie_params 
      params.require(:movie).permit(:title, :release_year)
    end
end