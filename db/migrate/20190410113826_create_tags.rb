class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
    	t.string :name
    	t.integer :article_id
    end
  end
end
