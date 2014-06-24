class SchedulesController < ApplicationController
	before_action :set_event
	before_action :correct_event, only: [:destroy]
	before_action :authenticate_user!


	def new
	@schedule = @event.schedules.build
	end

	def create
		@schedule = @event.schedules.build(schedule_params)

		respond_to do |format|
			if @schedule.save
				format.html { redirect_to @event, notice: 'Schedule was successfully created.'}
			else
				format.html { render action: 'new' }
			end
		end
	end


	def destroy
		@schedule.destroy
		redirect_to @event
	end

private
	def set_event
		@event= Event.find(params[:event_id])
	end

	def schedule_params
      params.require(:schedule).permit(:title, :start_date, :end_date, :location_name)
    end

    def correct_event
    	if current_user.admin?
    		@schedule = @event.schedules.find_by(id: params[:id])
    	else	
    		@schedule = nil
    	end
    	redirect_to @event if @schedule.nil?
    end



end
