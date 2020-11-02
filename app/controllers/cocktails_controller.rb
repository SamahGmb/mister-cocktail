class CocktailsController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show]

  def index
    @user = User.find(1)
    @cocktails = Cocktail.all
    @categories = @cocktails.group_by { |cocktail| cocktail.category }
  end

  def show
    @user = current_user
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user = current_user
    @cocktail.save!

    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy

    redirect_to root_path
  end

  def my_cocktails
    @cocktails = Cocktail.where(user:current_user)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :photo)
  end

end
