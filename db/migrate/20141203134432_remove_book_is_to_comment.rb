class RemoveBookIsToComment < ActiveRecord::Migration
  def change
    remove_column :comments, :book_id, :integer
  end
end
