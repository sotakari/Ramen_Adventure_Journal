class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @reviews = Review.page(params[:page])
  end

  def show
    @review = Review.find(params[:id])
    @review_comment =ReviewComment.new
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path, notice: '削除が完了しました'
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to admin_review_path(@review)
    else
      render :edit
    end
  end

  def review_params
    params.require(:review).permit(:shop_name, :ramen_image, :ramen_name, :price, :review_comment,
    :all_rating, :noodle_rating, :soup_rating, :topping_rating)
  end
end
