class Device < ActiveRecord::Base
	belongs_to :user
	has_many :sensors

	def to_hash
		a = []
		self.sensors.each do |x|
			a.push x.to_hash
		end
		{name: self.name, secret: self.secret, values: a}
	end
end
