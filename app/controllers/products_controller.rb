class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
    @categories = Category.all
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    @categories = @product.categories
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = ["Thanks for entering a new product called #{@product.title}"]
      redirect_to @product # same as product_path(@product)
    else
      flash[:error] = @product.errors.full_messages
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    success = @product.update(product_params)
    if success
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:error] = ["You have removed product called #{@product.title}"]
    redirect_to root_path
  end

  private
    def product_params
     params.require(:product).permit(:title, :description, :price, :quantity, :picture)
    end
end
