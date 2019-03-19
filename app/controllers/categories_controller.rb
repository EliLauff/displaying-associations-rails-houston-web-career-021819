class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(strong_params(:name))
    redirect_to category_path(@category)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(strong_params(:name))
    redirect_to category_path(@category)
  end

    private

  def strong_params(*args)
    params.require(:category).permit(*args)
  end
end
