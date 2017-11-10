class CocktailsController < ApplicationController
  def index
    if params[:q].present?
      @search = params[:q]
      @cocktails = Cocktail.where("cocktails.name iLIKE '%#{@search}%'")
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new"
    end
  end

  private

  def cocktails_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
