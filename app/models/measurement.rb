class Measurement < ActiveRecord::Base
  belongs_to :sensor
  validates :sensor, presence: true
  #validates :value, :numericality => {:less_than => 1, :greater_than_or_equal_to => 0}, if: :isMovement?
 
  # def isMovement?
  #  sensor.kind == "movement"
  # end
end
