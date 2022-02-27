class CreateSalons < ActiveRecord::Migration[6.1]
  def change
    create_table :salons do |t|
      t.string :company_name
      t.string :gstin
      t.string :pan_number
      t.text :address
      t.integer :chairs_counter
      t.datetime :opening
      t.datetime :closing

      t.timestamps
    end
  end
end
