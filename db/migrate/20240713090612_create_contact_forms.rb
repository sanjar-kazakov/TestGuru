class CreateContactForms < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_forms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :phone_number
      t.text :body


      t.timestamps
    end


    add_index :contact_forms, :phone_number
  end
end
