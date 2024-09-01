class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false, index: true
      t.string :description, null: false
      t.string :rule_value, null: false
      t.string :path, null: false
      t.datetime :deleted_at, index: true
      t.references :author, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
