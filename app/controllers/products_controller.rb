class ProductsController < ApplicationController
  respond_to :html

  before_action :load_product, only: %w(show edit update destroy)

  def index
    @products = Product.all.page(params[:page])
  end

  def show
    @clients = @product.clients.page(params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Created'
      respond_with :edit, @product
    else
      flash[:warning] = @user.errors.full_messages.uniq.join(', ')
      respond_with :new, :product
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Updated'
      respond_with :edit, @product
    else
      flash[:warning] = @user.errors.full_messages.uniq.join(', ')
      respond_with :edit, @product
    end
  end

  def destroy
    if @product.destroy
      flash[:notice] = 'Deleted'
    else
      flash[:warning] = 'Can not delete'
    end
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :unit, :price, :description)
  end

  def load_product
    @product = Product.find(params[:id])
  end
end
