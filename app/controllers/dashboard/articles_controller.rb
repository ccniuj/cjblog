class Dashboard::ArticlesController < Dashboard::DashboardController
  def index
    @articles = @paginate = Article.order(created_at: :DESC).page(params[:page]).per(5)
    render json: @articles
  end

  def edit
    @article = Article.find_by id: params[:id]
    render json: @article
  end

  def create
    @article = Article.new(article_params)
    if @article.save!
      render json: { message: '新增成功' }
    else
      render json: { message: '新增失敗' }
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      render json: { message: '更新成功' }
    else
      render json: { message: '更新失敗' }
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    render json: { message: '刪除成功' }
  end

  private
  def article_params
    params.require(:article).permit(:name, :title, :text)
  end
end
