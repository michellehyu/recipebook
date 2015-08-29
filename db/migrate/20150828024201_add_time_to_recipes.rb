class AddTimeToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :prep_time, :integer
    add_column :recipes, :cook_time, :integer
    add_column :recipes, :show, :boolean
  end
end
