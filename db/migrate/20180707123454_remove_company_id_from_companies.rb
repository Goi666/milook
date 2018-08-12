class RemoveCompanyIdFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :company_id, :integer
  end
end
