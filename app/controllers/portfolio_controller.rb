class PortfolioController < ApplicationController
  def new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      flash[:success] = "Successfully added project to database."
    else
      flash[:error] = "Could not save project to database."
    end
    redirect_to portfolio_path
  end

  def destroy
    @portfolio = Portfolio.find_by(:id => params[:id])
    if @portfolio.destroy
      flash[:success] = "Successfully deleted project from database."
    else
      flash[:error] = "Could not delete project from database."
    end
    redirect_to portfolio 
  end
  
  def edit
  end
  
  private
    def portfolio_params
      params.require(:portfolio).permit(:project,:description,:links)
    end
end
