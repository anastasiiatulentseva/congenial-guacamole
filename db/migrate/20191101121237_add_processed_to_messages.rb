class AddProcessedToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :processed, :boolean, default: false

    add_index :messages, :processed
  end
end
