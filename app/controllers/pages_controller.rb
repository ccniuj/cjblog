class PagesController < ApplicationController
  def articles
    if user_signed_in?
      @articles = Article.order(created_at: :DESC)
    else
      @articles = Article.where(is_presented: true).order(created_at: :DESC)
    end
    render json: @articles
  end

  def article
    @article = Article.find_by name: params[:name]
    render json: @article
  end
end
