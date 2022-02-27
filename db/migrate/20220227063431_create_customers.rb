class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.text :address
      t.string :mobile_number
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end
