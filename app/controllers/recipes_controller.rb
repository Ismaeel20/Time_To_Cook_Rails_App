class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = find(params[:id])
    @recipe.destroy
    @recipe.save
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
  end

  # private

  # def recipe_params
  #   params.require(:recipe).permit(:ingredient, :time)
  # end
end
