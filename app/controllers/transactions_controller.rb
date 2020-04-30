class TransactionsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_transaction, only: [:show, :edit, :update]

    def index 
        @transactions = current_user.transactions
    end 

    def find 
        @category = Category.find_by(name: params[:transaction][:category_id])
        @transactions = Transaction.by_category(@category, current_user)
        render :index 
    end

    def new
        if params[:budget_id]  == nil 
          @transaction = Transaction.new
          render :new 
        else 
          @transaction = Transaction.new(budget_id: params[:budget_id])
          render :new 
        end  
    end 

    def create  
        @transaction = current_user.transactions.build(transaction_params)
        @budget = Budget.find_by(name: transaction_params[:budget_id])
        @transaction.budget_id = @budget.id
        @category = Category.find_or_create_by(name: transaction_params[:category_id])
        @category.transactions << @transaction
       
        if @transaction.save
           show_transaction
        else
          flash[:alert] = "Transaction did not save. Please try again."
          render :new 
        end

    end 

    def show 
    end 

    def edit
    end 

    def update 
        if @transaction.update(transaction_params)
        show_transaction
        else 
          flash[:alert] = "Transaction did not update. Please try again."
          render :edit
        end 
    end 

    def destroy 
        Transaction.find(params[:id]).destroy
        redirect_to user_transactions_path(current_user)
    end 


    private
    
    def transaction_params
        params.require(:transaction).permit(:store_name, :amount, :date, :user_id, :budget_id, :category_id, category_attributes: [:name], budget_attributes: [:name])
    end 

    def find_transaction
        @transaction = Transaction.find(params[:id])
    end 

    def show_transaction
        redirect_to transaction_path(@transaction)
    end 

end
