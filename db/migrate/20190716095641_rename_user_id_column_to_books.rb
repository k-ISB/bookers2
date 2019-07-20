class RenameUserIdColumnToBooks < ActiveRecord::Migration[5.2]
  def change
  	 rename_column :books, :UserId, :user_id
  end
end
