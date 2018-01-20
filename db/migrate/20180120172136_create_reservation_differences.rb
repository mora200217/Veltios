class CreateReservationDifferences < ActiveRecord::Migration[5.1]
  def change
    create_table :reservation_differences do |t|
      t.integer :element_id
      t.integer :reservation_block
      t.date :reservation_date
      t.integer :reservation_amount

      t.timestamps
    end
  end
end
