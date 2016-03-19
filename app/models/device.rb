class Device < ActiveRecord::Base
	enum kind: [ :movement, :distance, :gas ]
	belongs_to :user
  has_many :sensors
  
  def sensorsToJson
    @s = self.sensors
  end
end
