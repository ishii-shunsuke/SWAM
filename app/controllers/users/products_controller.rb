class Users::ProductsController < ApplicationController

  def top
    @q = Product.includes(:artist).ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def index
  	@q = Product.includes(discs: :songs).ransack(params[:q])
    @products = @q.result(distinct: true).includes(:artist)
  end

  def search
    @q = Product.search(search_params)
    @products = @q.result(distinct: true)
  end

  def show
  end

  private
  def search_params
    params.require(:q).permit!
  end
end
