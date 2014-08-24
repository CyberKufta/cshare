class CommentsController < ApplicationController

	def new
		@parent_id = params.delete(:parent_id)
		@commentable = find_commentable
		@comment = Comment.new( parent_id: @parent_id,
								commentable_id: @commentable.id,
								commentable_type: @commentable.class.to_s)
	end

	def create
		@commentable = find_commentable 
		if params[:comment][:parent_id].blank?
			@ancestry = nil
		else
			@parent = Comment.find(params[:comment][:parent_id])
			if @parent.root?
				@ancestry = params[:comment][:parent_id]
			else
				@ancestry = "#{@parent.ancestry}/#{@parent.id}"
			end
		end
		@comment = @commentable.comments.build(content: params[:comment][:content], ancestry: @ancestry)
		@comment.user_id = current_user.id

		if @comment.save
			flash[:notice] = "Successfully posted comment" 
			redirect_to @commentable
		else
			flash[:alert] = "Error adding comment" 
			redirect_to @commentable
		end
	end


		private 

			def find_commentable
				params.each do |name, value|
					if name =~ /(.+)_id$/
						return $1.classify.constantize.find(value)
					end
				end
				nil
			end
end
