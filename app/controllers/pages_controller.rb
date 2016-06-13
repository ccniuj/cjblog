class PagesController < ApplicationController
  def articles
    @articles = Article.all.order(created_at: :DESC)
    render json: @articles
  end

  def article
    @article = Article.find_by name: params[:name]
    render json: @article
  end
end
