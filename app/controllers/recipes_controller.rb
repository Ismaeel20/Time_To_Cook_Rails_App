class RecipesController < ApplicationController
  def show
    @recipes = Recipe.all
    @recipe = Recipe.find(params[:id])
    @new_recipe = Recipe.new
  end

  # def new
  #   @recipe = Recipe.new
  # end
  def index
    @recipes = Recipe.all
    @new_recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, status: :see_other
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # private

  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
