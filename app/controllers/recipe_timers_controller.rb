class RecipeTimersController < ApplicationController
  def show
    @recipe_timers = Recipe_timer.all
    @recipe_timer = Recipe_timer.find(params[:id])
    @new_recipe_timer = Recipe_timer.new
  end

  def edit
    @recipe_timer = Recipe_timer.find(params[:id])
  end

  def create
    @recipe_timer = Recipe_timer.new(recipe_timer_params)
    @recipe_timer.user = current_user
    @recipe_timer.save
    redirect_to recipe_timer_path(@recipe_timer)
  end

  def destroy
    @recipe_timer = Recipe_timer.find(params[:id])
    @recipe_timer.destroy
    redirect_to recipe_timers_path, status: :see_other
  end

  def update
    @recipe_timer = Recipe_timer.find(params[:id])
    if @recipe_timer.update(recipe_timer_params)
      redirect_to recipe_timer_path(@recipe_timer)
    else
      render 'edit', status: :unprocessable_entity
    end
  end
end
