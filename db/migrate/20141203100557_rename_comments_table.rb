class RenameCommentsTable < ActiveRecord::Migration
  def change
    rename_column :comments, :book_is, :book_id
    rename_column :comments, :user_is, :user_id
  end
end
