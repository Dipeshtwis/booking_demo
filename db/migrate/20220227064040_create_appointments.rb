class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.time :start_time
      t.time :end_time
      t.references :service, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
