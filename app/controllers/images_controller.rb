class ImagesController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: :destroy

	def create
		@photo = current_user.images.build(image_params)
		found_event = current_user.nearby_happening(@photo.lat, @photo.lon).first
		unless found_event.nil?
			@photo.event_id = found_event.event_id
		 	@photo.tag_list = found_event.event.title.tr(" ","_").camelize(:lower), found_event.event.location_name.tr(" ","_").camelize(:lower)
		end
		if @photo.save
			flash[:notice] = "Photo has been uploaded at" + @photo.lat.to_s + ','  + @photo.lon.to_s
			redirect_to root_url
		else
			render 'static_pages/home'

		end
	end

	def index
		if params[:tag]
			@images = Image.tagged_with(params[:tag]).order("created_at DESC")
			@count = @images.count
		else
		@images = Image.all
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