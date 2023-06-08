class ChangeTimeInRecipeTimers < ActiveRecord::Migration[7.0]
  def change
    change_column :recipe_timers, :time, :float, using: 'time::float'
  end
end
