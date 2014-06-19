class ImagesController < ApplicationController
before_action :user_signed_in?
before_action :correct_user, only: :destroy

	def create
		@photo = current_user.images.build(image_params)
		if @photo.save
			flash[:notice] = "Photo has been uploaded at" + @photo.lat.to_s + ','  + @photo.lon.to_s
			redirect_to root_url
		else
			render 'static_pages/home'

		end
	end

	def destroy
		@image.destroy
		redirect_to root_url
	end



private

	def image_params
		params.require(:image).permit(:image, :lat, :lon)
	end

	def correct_user
	 @image = current_user.images.find_by(id: params[:id])
	 redirect_to root_url if @image.nil?
	end


end