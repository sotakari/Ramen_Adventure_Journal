class Public::ReviewsController < ApplicationController
  def index
    @reviews = Review.page(params[:page])

    if params[:min_price].present?
      @reviews = @reviews.where('price >= ?', params[:min_price])
    end

    if params[:max_price].present?
      @reviews = @reviews.where('price <= ?', params[:max_price])
    end

    if params[:min_rating].present?
      min_rating = params[:min_rating].to_f
      @reviews = @reviews.where('all_rating >= ?', min_rating)
    end

    if params[:max_rating].present?
       max_rating = params[:max_rating].to_f
      @reviews = @reviews.where('all_rating <= ?', max_rating)
    end
  end

  def show
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to review_path(@review), notice: '投稿が完了しました'
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review), notice: '更新が完了しました'
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path, notice: '削除が完了しました'
  end

  private

  def review_params
    params.require(:review).permit(:shop_name, :ramen_image, :ramen_name, :price, :review_comment, :category,
    :all_rating, :noodle_rating, :soup_rating, :topping_rating)
  end

end
