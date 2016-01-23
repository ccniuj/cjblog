class PortfoliosController < ApplicationController
  
  http_basic_authenticate_with name: ENV['user_name'], password: ENV['user_password'], except: [:index, :show]

  def index
  	@portfolios = @paginate = Portfolio.page(params[:page]).per(8)
  end

  def show
  	@portfolio = Portfolio.find(params[:id])
  end

  def new
  	@portfolio = Portfolio.new
  end

  def edit
  	@portfolio = Portfolio.find(params[:id])
  end

  def create
  	@portfolio = Portfolio.new(portfolio_params)
  	if @portfolio.save
  	  redirect_to portfolios_path
  	else
  	  render 'new'
  	end
  end

  def update
  	@portfolio = Portfolio.find(params[:id])

  	if @portfolio.update(portfolio_params) then
  	  redirect_to portfolios_path
  	else
  	  render 'edit'
  	end
  end

  def destroy
  	@portfolio = Portfolio.find(params[:id])
  	@portfolio.destroy

  	redirect_to @portfolio
  end

  private
  def portfolio_params
  	params.require(:portfolio).permit(:name, :description, :cover)
  end
end
