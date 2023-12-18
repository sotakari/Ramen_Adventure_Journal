class Public::TagsearchesController < ApplicationController
  def search
    @model = Review  #search機能とは関係なし
    @word = params[:content]
    @reviews = Review.where("category LIKE?","%#{@word}%")
    render "public/tagsearches/tagsearch"
  end
end
