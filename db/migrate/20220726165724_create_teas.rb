class CreateTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :teas do |t|
      t.string :name
      t.string :description
      t.integer :brew_temp_f
      t.integer :brew_time_mins

      t.timestamps
    end
  end
end
