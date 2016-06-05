class Dashboard::DashboardController < ApplicationController
  before_action :authenticate_user!

  def upload
    url = S3.upload 'articles', params['0'].tempfile
    render json: { message: '上傳成功', url: url }
  end
end