class StaticPagesController < ApplicationController
  def home
  	@photo = current_user.images.build if user_signed_in?
  	@latitude = cookies[:latitudine].nil? ? '0.00' : cookies[:latitudine]
	@longitude = cookies[:longitudine].nil? ? '0.00' : cookies[:longitudine]
	@uploaded_images =current_user.images.order("created_at DESC").limit(15) if user_signed_in?
	@events = Event.order("start_date DESC")
    end


end