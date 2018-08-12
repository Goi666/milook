class ChangeColumnCompanies < ActiveRecord::Migration[5.2]
  #変更後の型
  def up
    change_column :companies, :image, :string, default: ""
  end
  
  #変更前の型
  def down
    change_column :companies, :image, :string, default: "noimage.jpg"
  end
end