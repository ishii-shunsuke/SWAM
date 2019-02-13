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
    end

private
   def product_params
      params.require(:product).permit(:title,:jacket_image,:price,:period,:stock, discs_attributes: [:id, :disc_number, :_destroy],songs_attributes: [:id, :name, :song_number, :_destroy])
   end

end