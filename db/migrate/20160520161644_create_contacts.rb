class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name, null: false
      t.string :email, null: false
      t.string :phone_number
      t.text :question, null: false
      t.string :contact_method, null: false
    end
  end
end
