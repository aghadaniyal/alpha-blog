class AddDefaultValueToCategories < ActiveRecord::Migration[5.2]
  def change
  	add_column :categories, :is_default, :boolean, default:false
  end
end
