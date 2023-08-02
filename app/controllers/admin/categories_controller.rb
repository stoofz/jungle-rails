class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_opts)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Created'
    else
      render :new
    end
  end

  private
  def category_opts
    params.require(:category).permit(:name)
    end
  end

