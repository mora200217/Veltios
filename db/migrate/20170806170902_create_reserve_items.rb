class CreateReserveItems < ActiveRecord::Migration[5.1]
  def change
    create_table :reserve_items do |t|
      t.references :element, foreign_key: true
      t.references :reserve, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
