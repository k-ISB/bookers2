class AddUserIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :UserId, :integer
  end
end
