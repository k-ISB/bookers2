class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  # 変更内容
  def up
    change_column :users, :uuid, :string, index: true
  end

  # 変更前の状態
  def down
    change_column :users, :name, :string, index: false
  end
end
