class Sensor < ActiveRecord::Base
	enum kind: [ :movement, :distance, :gas ]
	belongs_to :device
	validates :device, presence: true
	has_many :measurements
	validates :kind, presence: true

	def to_hash
		a = []
		self.measurements.last(10).each do |x|
			a.push x.to_hash
		end
		{name: self.name, kind: self.kind, values: a}
	end
end
