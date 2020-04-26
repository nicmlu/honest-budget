class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :store_name
      t.float :amount
      t.datetime :date
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :budget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
