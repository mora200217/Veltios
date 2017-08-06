class CreateElements < ActiveRecord::Migration[5.1]
  def change
    create_table :elements do |t|
      t.string :name
      t.text :desciption
      t.string :brand
      t.string :units
      t.decimal :uncertainty
      t.boolean :available
      t.integer :amount
      t.string :school

      t.timestamps
    end
  end
end
