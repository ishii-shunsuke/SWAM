class Users::ProductsController < ApplicationController

  def top
    @q = Product.includes(:artist).ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def index
  	@q = Product.includes(discs: :songs).ransack(params[:q])
    @products = @q.result(distinct: true).includes(:artist, :category)
    @categories = Category.all
  end

  def search
    @q = Product.search(search_params)
    @products = @q.result(distinct: true)
  end

  def show
    @product = Product.find(params[:id])
   	@cart = Cart.new
  end

  private
  def search_params
    params.require(:q).permit!
  end
end
