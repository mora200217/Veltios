class RenameReservationBlockInReservationDifference < ActiveRecord::Migration[5.1]
  def change
    rename_column :reservation_differences, :reservation_block, :block
    rename_column :reservation_differences, :reservation_date, :date
    rename_column :reservation_differences, :reservation_amount, :amount

  end
end
