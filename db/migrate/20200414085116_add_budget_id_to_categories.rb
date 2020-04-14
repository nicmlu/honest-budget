class AddBudgetIdToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :budget_id, :integer
  end
end
