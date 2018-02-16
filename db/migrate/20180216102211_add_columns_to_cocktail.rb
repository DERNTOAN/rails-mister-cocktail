class AddColumnsToCocktail < ActiveRecord::Migration[5.1]
  def change
    add_column :cocktails, :instruction, :text
    add_column :cocktails, :image, :string
  end
end
