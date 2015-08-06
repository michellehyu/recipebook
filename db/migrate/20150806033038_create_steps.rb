class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :order
      t.text :description
      t.references :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
