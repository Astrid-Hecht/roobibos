class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :customer, foreign_key: true
      t.string :title
      t.float :price
      t.int :status
      t.int :frequency

      t.timestamps
    end
  end
end
