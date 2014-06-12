class StaticPagesController < ApplicationController
  def home
  	@photo = current_user.images.build if user_signed_in?
  end
end
