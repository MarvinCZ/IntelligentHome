class Sensor < ActiveRecord::Base
	enum kind: [ :movement, :distance, :gas ]
  belongs_to :device
  validates :device, presence: true
	has_many :measurements
	validates :kind, presence: true
  
  def measurementsToJson
    self.measurements
  end
end
