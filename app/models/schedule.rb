class Schedule < ActiveRecord::Base
  belongs_to :event

  validate :start_date_cannot_be_before_event, :end_date_cannot_be_after_event

  def start_date_cannot_be_before_event
  	if start_date.present? && start_date < event.start_date
  		errors.add(:start_date, "can't be earlier than the start of the event")
  	end
  end

  def end_date_cannot_be_after_event
  	if end_date.present? && end_date > event.end_date
  		errors.add(:end_date, "can't be after the event has ended")
  	end
  end

end
