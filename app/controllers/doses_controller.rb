class DosesController < ApplicationController

  before_action :set_dose, only: [:edit, :update, :destroy]
  before_action :set_cocktail_id, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save

    redirect_to cocktail_path(@cocktail)
  end

  def edit

  end

  def update
    @dose.update(dose_params)

    redirect_to cocktail_path(@dose.cocktail)
  end

  def destroy
    @dose.destroy

    redirect_to cocktail_path(@dose.cocktail)
  end

  private

 def dose_params
  params.require(:dose).permit(:amount, :unit, :ingredient_id)
 end

 def set_dose
  @dose = Dose.find(params[:id])
 end

 def set_cocktail_id
  @cocktail = Cocktail.find(params[:cocktail_id])
 end

end
