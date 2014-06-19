class StaticPagesController < ApplicationController
  def home
  	@photo = current_user.images.build if user_signed_in?
  	@latitude = cookies[:latitudine].nil? ? '0.00' : cookies[:latitudine]
	@longitude = cookies[:longitudine].nil? ? '0.00' : cookies[:longitudine]
    end


end
