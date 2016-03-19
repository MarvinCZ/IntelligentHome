class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :devices

	def get_data
		a = []
		self.devices.each do |x|
			a.push x.to_hash
		end
		json = a.to_json
	end
end
