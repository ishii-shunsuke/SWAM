class Admins::ProductsController < ApplicationController

  def index
    	@products = Product.all
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


end