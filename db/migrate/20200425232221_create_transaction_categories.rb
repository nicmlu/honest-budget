class CreateTransactionCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_categories do |t|
      t.integer :transaction_id
      t.integer :category_id

      t.timestamps
    end
  end
end
