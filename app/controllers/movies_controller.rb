# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  
  def filterAndOrder
  	orderHash = {"title_header" => "title ASC", "release_date_header" => "release_date ASC"}
  	
  	@order = orderHash[params[:sort]] || session[:sort] || nil
  	
    if(@order.nil?) then 
      @order = ""
      flash[:notice] = "Invalid order, redirected" 
      flash.keep
      redirect_to "/movies"
    end
  
  	ratings = params[:ratings].class == ActionController::Parameters ? params[:ratings].keys : nil
  	
  	# Ratings can never be nil, since @all_ratings is not nil
  	@selectedRatings = ratings || session[:ratings] || @all_ratings
  	
  	session[:ratings] = @selectedRatings
  	session[:sort] = @order
  	
  end
  
  def index
    @all_ratings = Movie.all_ratings
  	filterAndOrder
    @movies = Movie.where(:rating => session[:ratings]).order(session[:sort])
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def new
    @movie = Movie.new
  end

  def create
    #@movie = Movie.create!(params[:movie]) #did not work on rails 5.
    @movie = Movie.create(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created!"
    redirect_to movies_path
  end

  def movie_params
    params.require(:movie).permit(:title,:director,:rating,:description,:release_date)
  end

  def edit
    id = params[:id]
    @movie = Movie.find(id)
    #@movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    #@movie.update_attributes!(params[:movie])#did not work on rails 5.
    @movie.update(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated!"
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find params[:id]
    @movie.destroy
    flash[:notice] = "#{@movie.title} was deleted!"
    redirect_to movies_path
  end
  
  def samedirectors
    @movie = Movie.find(params[:id])
    @movies = Movie.samedirectors(@movie)
  end
  
end
