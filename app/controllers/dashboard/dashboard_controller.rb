class Dashboard::DashboardController < ApplicationController
  before_action :authenticate_user!

  def get_current_user
    data = {
      id: current_user.id,
      username: current_user.email.split('@').first
    }
    render json: data
  end

  def upload
    url = S3.upload 'articles', params['0'].tempfile
    render json: { message: '上傳成功', url: url }
  end
end