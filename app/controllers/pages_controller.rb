class PagesController < ApplicationController
  def articles
    @articles = Article.all.order(created_at: :DESC)
    render json: @articles
  end
end
