class CreateMixes < ActiveRecord::Migration
  def change
    create_table :mixes do |t|
    	t.integer :user_id
    	t.string :title
    	t.string :text
      t.timestamps null: false
    end
  end
end
