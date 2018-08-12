class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :company_id
      t.string :user_name ,null: false, default: "颯爽の社畜侍"
      t.string :comment

      t.timestamps
    end
  end
end
