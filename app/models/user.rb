class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events, foreign_key: "created_by_id"
  has_many :attendances, foreign_key: "user_id", dependent: :destroy
  has_many :attending, through: :attendances, source: :event
  has_many :images
  has_many :votes, dependent: :destroy




  def ongoing(s_date, e_date)
    attending.where('events.start_date <= ? AND events.end_date >= ?', s_date, e_date )
  end

  def nearby_happening(lon,lat)

   Location.near([lon,lat]).where(event_id: self.ongoing(Time.now, Time.now)).all

  end


  def attending?(event)
  	attendances.find_by(event_id: event.id)
  end

  def attend!(event)
  	attendances.create!(event_id: event.id)
  end

  def unattend!(event)
  	attendances.find_by(event_id: event.id).destroy
  end

  def voted?(item)
    votes.find_by(votable_id: item.id, votable_type: item.class.name)
  end

  def vote!(item, value)
    votes.create!(votable_id: item.id, votable_type: item.class.name, value: value)
  end

  def unvote!(item)
    votes.find_by(votable_id: item.id).destroy
  end


end
