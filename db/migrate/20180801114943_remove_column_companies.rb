class RemoveColumnCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :image_url 
  end
end
