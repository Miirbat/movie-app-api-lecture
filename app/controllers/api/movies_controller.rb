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

  private 
    def movie_params 
      params.require(:movie).permit(:title, :release_year)
    end
end