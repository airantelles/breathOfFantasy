class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :energy
      t.integer :power

      t.timestamps
    end
  end
end
