class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :purchase_price, null: false
      t.integer :down_payment, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :contact_method, null: false

      t.timestamps null: false
    end
  end
end
