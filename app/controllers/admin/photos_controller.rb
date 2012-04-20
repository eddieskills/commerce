class Admin::PhotosController < AdminController
	def create
		@product = Product.find(params[:product_id])
		@photo = @product.photos.new(params[:photo])
		if @photo.save
			flash[:success] = "Votre photo a bien ete ajoutee"
			redirect_to [:admin, @product]
		else
			flash[:error] = "Erreur lors de l'upload de la photo"
			render :new
		end
	end

	def new
		@product = Product.find(params[:product_id])
		@photo = Photo.new
	end
end