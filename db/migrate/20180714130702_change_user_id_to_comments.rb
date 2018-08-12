class ChangeUserIdToComments < ActiveRecord::Migration[5.2]
  #変更後の型
  def up
    change_column :comments, :user_id, :string
  end

  #変更前の型
  def down
    change_column :comments, :user_id, :integer
  end
end
