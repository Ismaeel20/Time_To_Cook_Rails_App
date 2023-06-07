class RecipeTimersController < ApplicationController
  # def show
  #   @recipe_timers = RecipeTimer.all
  #   @recipe_timer = RecipeTimer.find(params[:id])
  #   @new_recipe_timer = RecipeTimer.new
  # end

  def edit
    # raise
    @recipe_timer = RecipeTimer.find(params[:id])
  end

  def create
    @recipe_timer = RecipeTimer.new(recipe_timer_params)
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_timer.recipe = @recipe
    if @recipe_timer.save!
      redirect_to recipe_path(@recipe)
    else
      render "recipes#show", status: :unprocessable_entity
    end

  end

  def destroy
    @recipe_timer = RecipeTimer.find(params[:id])
    @recipe_timer.destroy
    redirect_to recipe_timers_path, status: :see_other
  end

  def update
    @recipe_timer = RecipeTimer.find(params[:id])
    if @recipe_timer.update(recipe_timer_params)
      redirect_to recipe_path(@recipe_timer.recipe)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def recipe_timer_params
    params.require(:recipe_timer).permit(:ingredient, :time)
  end



end
