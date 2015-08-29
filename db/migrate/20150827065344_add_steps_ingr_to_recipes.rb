class AddStepsIngrToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :ingredients, :text
    add_column :recipes, :steps, :text
  end
end
