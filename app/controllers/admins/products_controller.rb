class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!
  protect_from_forgery :except => [:create]

	def top
	end

  def index
    	 # @products = Product.all
    @q = Product.page(params[:page]).ransack(params[:q])
    @labels = Label.all
    @categories = Category.all
    @products = @q.result(distinct: true).includes(:label, :category)

  end

  def search
    @q = Product.search(search_params)
    @products = @products.page(params[:page]).per(10)
    @products = @q.result(distinct: true)
  end

	def new
		@product = Product.new
		@disc = @product.discs.build
    @song = @disc.songs.build
    @artist = Artist.new
    @label = Label.new
    @category = Category.new
	end

  def createe
    @artist = Artist.new
    @artist.save
    redirect_to new_admins_product_path
  end

	def create
    # @product = current_user.product.build(product_params)

    @product = Product.new(product_params)


    # artist = Artist.find_by(artist_name: params[:product][:artists][:artist_name])
    # @product.artist_id = artist.id

    @label = Label.new(label_name: params[:product][:labels][:label_name])
    @label.save
    label = Label.find_by(label_name: params[:product][:labels][:label_name])
    @product.label_id = label.id

    @category = Category.new(category_name: params[:product][:categories][:category_name])
    @category.save
    category = Category.find_by(category_name: params[:product][:categories][:category_name])
    @product.category_id = category.id

# logger.debug @product.errors.inspect

    @product.save
    redirect_to admins_product_path (@product.id)

  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admins_product_path(@product.id)
  end

  def destroy
    @product =Product.find(params[:id])
    @product.destroy
    redirect_to admins_products_path
  end

private
    def product_params
        params.require(:product).permit(:title,:jacket_image,:price,:period,:stock, discs_attributes: [:id, :disc_number, :_destroy, songs_attributes: [:id, :name, :song_number, :_destroy]],artists_attributes: [:id, :artist_name, :product_id, :_destroy],labels_attributes: [:id, :label_name, :product_id, :_destroy])
    end

    def search_params
      params.require(:q).permit!
    end

end
