class RecipesController < ApplicationController
  def show
    @recipes = Recipe.where(user: current_user)
    @recipe = Recipe.find(params[:id])
    @new_recipe = Recipe.new
    @new_timer = RecipeTimer.new
  end

  # def new
  #   @recipe = Recipe.new
  # end

  def index
    @recipes = Recipe.where(user: current_user)
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

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instructions)
  end
end
