class CreateReserves < ActiveRecord::Migration[5.1]
  def change
    create_table :reserves do |t|
      t.integer :total
      t.references :reserve_status, foreign_key: true

      t.timestamps
    end
  end
end
