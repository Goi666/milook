class AddColumnCompanies < ActiveRecord::Migration[5.2]
  def change
    add_index :companies, :image_url 
  end
end
