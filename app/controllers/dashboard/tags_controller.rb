class Dashboard::TagsController < Dashboard::DashboardController
  def index
    @tags = Tag.all.order(created_at: :DESC)
    render json: @tags
  end

  def show
    @tag = Tag.find_by id: params[:id]
    render json: @tag
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save!
      render json: { message: '新增成功' }
    else
      render json: { message: '新增失敗' }
    end
  end

  def update
    @tag = Tag.find_by id: params[:id]
    if @tag.update!(tag_params)
      render json: { message: '更新成功' }
    else
      render json: { message: '更新失敗' }
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:name, :title)
  end
end