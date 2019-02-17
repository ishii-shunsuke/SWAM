class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!
	def top
	end

  def index
      @q = Product.ransack(params[:q])
      @products = @q.result(distinct: true)
      @labels = Label.all
  end

  def search
    @q = Product.ransack(search_params)
      @products = @q.result(distinct: true)
  end

	def new
		@product = Product.new
		@disc = @product.discs.build
    @song = @disc.songs.build
	end

	def create
    # @product = current_user.product.build(product_params)
		@product=Product.new(product_params)
		@product.save

logger.debug @product.errors.inspect

  end

  def show
    @product = Product.find(params[:id])
    @discs = @product.discs

  end

private
   def product_params
      params.require(:product).permit(:title,:jacket_image,:price,:period,:stock, discs_attributes: [:id, :disc_number, :_destroy],songs_attributes: [:id, :name, :song_number, :_destroy],artists_attributes: [:id, :artist_name, :product_id, :_destroy],labels_attributes: [:id, :label_name, :product_id, :_destroy])
   end

   def search_params
    params.require(:q).permit!
   end
end
