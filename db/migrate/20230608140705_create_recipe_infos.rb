class CreateRecipeInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_infos do |t|

      t.timestamps
    end
  end
end
