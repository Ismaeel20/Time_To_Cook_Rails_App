class CreateRecipeTimers < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_timers do |t|
      t.string :ingredient
      t.string :time
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
