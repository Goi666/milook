class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.integer :company_id
      t.integer :company_type ,null: false, default: ""
      t.string :company_name ,null: false, default: ""
      t.string :company_url ,null: false, default: ""

      t.timestamps
    end
  end
end
