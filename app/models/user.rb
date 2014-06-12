class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events, foreign_key: "created_by_id"
  has_many :attendances, foreign_key: "user_id", dependent: :destroy
  has_many :attending, through: :attendances, source: :event
  has_many :images






  def attending?(event)
  	attendances.find_by(event_id: event.id)
  end

  def attend!(event)
  	attendances.create!(event_id: event.id)
  end

  def unattend!(event)
  	attendances.find_by(event_id: event.id).destroy
  end
end
