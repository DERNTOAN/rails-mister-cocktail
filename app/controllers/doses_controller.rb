class DosesController < ApplicationController
   before_action :set_dose, only: [ :destroy ]
   before_action :set_cocktail, only: [ :new, :create ]

  def new
    @dose = Dose.new
  end

  def create
    @ingredients = Ingredient.all
    @dose = Dose.create(dose_params)
    @dose.cocktail = @cocktail
    if @dose.valid?
      @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.delete
    redirect_to cocktail_path
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
