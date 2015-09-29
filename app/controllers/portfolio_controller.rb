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
    @project = Portfolio.find_by(:id => params[:id])
    @project.project = params[:project]
    @project.description = params[:description]
    @project.link = params[:link]
    if @project.save
      flash[:success] = "Project successfully updated."
    else
      flash[:error] = "Project edits not saved."
    end
    redirect_to portfolio
  end
  
  private
    def portfolio_params
      params.require(:portfolio).permit(:project,:description,:link)
    end
end
