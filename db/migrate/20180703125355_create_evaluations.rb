class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :company_id
      t.integer :environment  ,null: false, default: 1
      t.integer :salary ,null: false, default: 1
      t.integer :overtime ,null: false, default: 1
      t.integer :boss ,null: false, default: 1
      t.integer :corporate_style  ,null: false, default: 1
      t.integer :management ,null: false, default: 1
      t.integer :dangerous  ,null: false, default: 1
      t.integer :other  ,null: false, default: 1

      t.timestamps
    end
  end
end
