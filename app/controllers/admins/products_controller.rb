class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!
  # protect_from_forgery :except => [:create]

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

  def artist_create
    @artist = Artist.new(artist_params)
    @artist.save
    redirect_to new_admins_product_path
  end

  def label_create
    @label = Label.new(label_params)
    @label.save
    redirect_to new_admins_product_path
  end

  def category_create
    @category = Category.new(category_params)
    @category.save
    redirect_to new_admins_product_path
  end

	def create
    # @product = current_user.product.build(product_params)

    @product = Product.new(product_params)


    # artist = Artist.find_by(artist_name: params[:product][:artists][:artist_name])
    # @product.artist_id = artist.id

    # @label = Label.new(label_name: params[:product][:labels][:label_name])
    # @label.save
    # label = Label.find_by(label_name: params[:product][:labels][:label_name])
    # @product.label_id = label.id

    # @category = Category.new(category_name: params[:product][:categories][:category_name])
    # @category.save
    # category = Category.find_by(category_name: params[:product][:categories][:category_name])
    # @product.category_id = category.id

# logger.debug @product.errors.inspect

    if @product.save
    redirect_to admins_product_path(@product.id)
    else
      render :new,  notice:"項目を記入してください。"
    end

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

  def artist_update
    @artist = Artist.new(artist_params)
    @artist.save
    redirect_to edit_admins_product_path
  end

  def label_update
    @label = Label.new(label_params)
    @label.save
    redirect_to edit_admins_product_path
  end

  def category_update
    @category = Category.new(category_params)
    @category.save
    redirect_to edit_admins_product_path
  end

  def destroy
    @product =Product.find(params[:id])
    @product.destroy
    redirect_to admins_products_path
  end

private
    def product_params
        params.require(:product).permit(:title,:jacket_image,:price,:period,:stock,:artist_id,:category_id,:label_id, discs_attributes: [:id, :disc_number, :_destroy, songs_attributes: [:id, :name, :song_number, :_destroy]],artists_attributes: [:id, :artist_name, :product_id, :_destroy])
    end

    def search_params
      params.require(:q).permit!
    end

    def artist_params
      params.require(:artist).permit(:artist_name)
    end

     def label_params
      params.require(:label).permit(:label_name)
    end

     def category_params
      params.require(:category).permit(:category_name)
    end

    # def product_params
    #     params.require(:product).permit(:title,:jacket_image,:price,:period,:stock, discs_attributes: [:id, :disc_number, :_destroy, songs_attributes: [:id, :name, :song_number, :_destroy]],artists_attributes: [:id, :artist_name, :product_id, :_destroy],labels_attributes: [:id, :label_name, :product_id, :_destroy])
    # end
end
