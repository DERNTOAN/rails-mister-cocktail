class RemoveNameFromDoses < ActiveRecord::Migration[5.1]
  def change
    remove_column :doses, :name, :string
    change_column :doses, :description, :string
  end
end
