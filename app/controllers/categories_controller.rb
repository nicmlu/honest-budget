class CategoriesController < ApplicationController

    def index
      @categories = Category.all.includes(:transactions)
    end

    def new
    end 

    def show
      @category = Category.find(params[:id])
    end
  
end
