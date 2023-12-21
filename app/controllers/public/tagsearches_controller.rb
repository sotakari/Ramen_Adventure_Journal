class Public::TagsearchesController < ApplicationController
  def search
    @model = Review  #search機能とは関係なし
    @word = params[:content]
    @reviews = Review.where("category LIKE?","%#{@word}%").page(params[:page])
    render "public/tagsearches/tagsearch"
  end
end
