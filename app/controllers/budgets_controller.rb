class BudgetsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_budget, only: [:show, :edit, :update]
    helper_method :remaining_money, :excess_income

    def index 
        @budgets = current_user.budgets
    end 

    def new
        @budget = Budget.new(user_id: params[:user_id])  
    end 

    def create
        @budget = current_user.budgets.build(budget_params)
        binding.pry
        if @budget.save
           redirect_to budget_path(@budget)
        else 
          flash[:alert] = "Budget did not save. Please try again."
          render :new 
        end

    end 

    def show 
    end 

    def edit
    end 

    def update
        @budget.update(budget_params)
        redirect_to user_budget_path(current_user)
    end 

    def destroy 
        Budget.find(params[:id]).destroy
        redirect_to user_budgets_path(current_user)
    end 


    private
    
    def budget_params
        params.require(:budget).permit(:name, :income, :expenses, :start_date, :end_date, :content, :notes, category_ids:[], categories_attributes: [:name])
    end 

    def excess_income
        @budget.income - @budget.expenses
    end 

    def remaining_money
        excess_income - total_spent
    end 
    
    def find_budget
        @budget = Budget.find(params[:id])
    end 

end
