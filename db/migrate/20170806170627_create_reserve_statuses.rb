class CreateReserveStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :reserve_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
