class VotesController < ApplicationController
	before_action :authenticate_user!


	def create
		@item = params[:vote][:votable_type].constantize.find_by(id: params[:vote][:votable_id])
		vote =  current_user.voted?(@item)
			if vote.nil?
				current_user.vote!(@item, params[:vote][:value])
			else 
				if vote.value.to_s == params[:vote][:value]
					vote.destroy
				else
					vote.destroy
					current_user.vote!(@item, params[:vote][:value])
				end
			end
			respond_to do |format|
				format.html { redirect_to home_path }
				format.js 
			end

	end



	def destroy
		if params[:votable_type] == "image"
			@item = Votes.find(params[:id]).image
		
		end

		current_user.unvote!(@item)
		respond_to do |format|
				format.html { redirect_to home_path }
				format.js 
		end
	end
end
