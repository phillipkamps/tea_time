class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.string :price
      t.string :status
      t.string :frequency
      t.references :user, foreign_key: true
      t.references :tea, foreign_key: true

      t.timestamps
    end
  end
end
