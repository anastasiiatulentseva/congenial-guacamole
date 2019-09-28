class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
