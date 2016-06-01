class ReviewsController < ApplicationController

  def index
    @user = User.find(params[:id])
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews
  end

  def new
    @movie = Movie.find(params[:id])
    @review = Review.new
    render :new
  end

  def create
    @review = Review.new(review_params)
    @user = current_user
    @movie = Movie.find(params[:id])
    @movie.reviews << @review
    @user.reviews << @review
    @movie.save
    @user.save
    @review.save

    redirect_to movie_reviews_path(@movie)
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
  def review_params
    params.require(:review).permit(:content, :rating, :subject)
  end
end
