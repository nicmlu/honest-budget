class TransactionsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index 
        @transactions = current_user.transactions
        # binding.pry
    end 

    def new
        @transaction = Transaction.new(user_id: params[:user_id]) 
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
        @transaction = Transaction.find(params[:id])
    end 

    def edit
        # binding.pry
        @transaction = Transaction.find(params[:id])
    end 

    def update 
        @transaction = Transaction.find(params[:id])
        @transaction.update(transaction_params)
        redirect_to user_transaction_path(current_user)
    end 

    def destroy 
        Transaction.find(params[:id]).destroy
        redirect_to user_transactions_path(current_user)
    end 


    private
    
    def transaction_params
        params.require(:transaction).permit(:store_name, :amount, :date, category_ids:[], categories_attributes: [:name])
    end 

end
