class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.references :college, foreign_key: true

      t.timestamps
    end
    add_index :users, :phone_number, unique: true
  end
end
