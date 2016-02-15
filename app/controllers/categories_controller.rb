class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @products = @category.products
    if request.xhr?
      render :partial => 'category', :locals => { :category => @category }
    else
     render 'products/index', :locals => { :category => @category }
    end
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = ["Thanks for entering a new category called #{@category.name}"]
      redirect_to @category
    else
      flash[:error] = @category.errors.full_messages
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    success = @category.update(category_params)
    if success
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:error] = ["You have removed product called #{@product.name}"]
    redirect_to root_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
