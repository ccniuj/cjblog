class PagesController < ApplicationController
  def articles
    @articles = Article.all
    render json: @articles
  end
end
