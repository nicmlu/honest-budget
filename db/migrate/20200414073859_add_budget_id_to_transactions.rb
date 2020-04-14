class AddBudgetIdToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :budget_id, :integer
  end
end
