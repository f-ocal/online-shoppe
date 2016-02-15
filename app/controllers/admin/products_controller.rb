class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      #errors
      render 'edit'
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = ["Thanks for entering a new product called #{@product.title}"]
      redirect_to admin_products_path
    else
      flash[:error] = @product.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:error] = ["You have removed product called, #{@product.title}"]
    redirect_to admin_products_path
  end

  private
    def product_params
     params.require(:product).permit(:title, :description, :price, :quantity, :picture)
    end
end
