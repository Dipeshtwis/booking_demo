class AddDaysToSalons < ActiveRecord::Migration[6.1]
  def change
    add_column :salons, :days, :string, dafault: [], array: true
  end
end
