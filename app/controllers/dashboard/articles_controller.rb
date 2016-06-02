class Dashboard::ArticlesController < Dashboard::DashboardController
  def index
    @articles = @paginate = Article.order(created_at: :DESC).page(params[:page]).per(5)
    render json: @articles
  end

  def show
    respond_to do |format|
      format.json do
  	    @article = Article.find(params[:id])
        render json: @article
      end
    end
  end

  def new
  	@article = Article.new
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def create
    respond_to do |format|
      format.json do
  	    @article = Article.new(article_params)
  	    if @article.save!
          render json: { message: '新增成功' }
  	    else
  	      render 'new'
  	    end
      end
    end
  end

  def update
  	@article = Article.find(params[:id])

  	if @article.update(article_params) then
      render json: { message: '更新成功' }
  	else
  	  render 'edit'
  	end
  end

  def destroy
  	@article = Article.find(params[:id])
  	@article.destroy
    render json: { message: '刪除成功' }
  end

  private
  def article_params
  	params.require(:article).permit(:text)
  end
end
