class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :cost
      t.string :time_taken
      t.references :salon, foreign_key: true

      t.timestamps
    end
  end
end
