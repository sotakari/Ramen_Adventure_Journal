class Admin::ReviewCommentsController < ApplicationController

  def destroy
    @comment = ReviewComment.find(params[:id])
    @comment.destroy
    @review = Review.find(params[:review_id])
  end
end
