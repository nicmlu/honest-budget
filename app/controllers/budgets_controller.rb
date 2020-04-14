class BudgetsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @budget = Budget.new 
    end 
end
