class CategoriesController < ApplicationController

    def index
      @categories = Category.all
    end

    def new
      @category.new
    end 

    def show
      @category = Category.find(params[:id])
    end

    def edit
    end 
  
end
