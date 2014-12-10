class CreateAddLikesToComments < ActiveRecord::Migration
  def change
    create_table :add_likes_to_comments do |t|
      t.integer :like

      t.timestamps null: false
    end
  end
end
