class TransactionsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_transaction, only: [:show, :edit, :update]

    def index 
        @transactions = current_user.transactions
    end 

    def new
        if params[:budget_id] && @budget = Budget.find_by_id(params[:id])
          @transaction = @budget.transactions.build
          render :new 
        else 
          @transaction = Transaction.new
          render :new 
        end  
    end 

    def create
        @transaction = current_user.transactions.build(transaction_params)
        if @transaction.save
           redirect_to transaction_path(@transaction)
        else 
          flash[:message] = "Transaction did not save. Please try again."
          render :new 
        end

    end 

    def show 
    end 

    def edit
    end 

    def update 
        @transaction.update(transaction_params)
        redirect_to user_transaction_path(current_user)
    end 

    def destroy 
        Transaction.find(params[:id]).destroy
        redirect_to user_transactions_path(current_user)
    end 


    private
    
    def transaction_params
        params.require(:transaction).permit(:store_name, :amount, :date)
    end 

    def find_transaction
        @transaction = Transaction.find(params[:id])
    end 

end
