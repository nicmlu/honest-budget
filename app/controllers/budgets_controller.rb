class BudgetsController < ApplicationController
    before_action :redirect_if_not_logged_in
    helper_method :remaining_money, :excess_income

    def index 
        @budgets = current_user.budgets
    end 

    def new
        @budget = Budget.new(user_id: params[:user_id])  
    end 

    def create
        binding.pry
        @budget = current_user.budgets.build(budget_params)
        if @budget.save
           redirect_to budget_path(@budget)
        else 
          flash[:message] = "Budget did not save. Please try again."
          render :new 
        end

    end 

    def show 
        @budget = Budget.find(params[:id])
    end 

    def edit
        @budget = Budget.find(params[:id])
    end 

    def update 
        @budget = Budget.find(params[:id])
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

end
