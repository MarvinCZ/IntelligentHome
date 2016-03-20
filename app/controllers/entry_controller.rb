class EntryController < ApplicationController
	def get_sensor secret, kind, uid
		d = Device.find_by_secret(secret)
		if d == nil
			d = Device.new
			d.secret = @secret
			d.save
		end
		s = d.sensors.where(kind: kind)
		if s.count == 0
			byebug
			s = Sensor.new
			s.uid = uid
			s.kind = 0
			s.device = d
			s.save
		else
			s = s.where(uid: uid).first
			if s == nil
				s = Sensor.new
				s.uid = @uid
				s.kind = 0
				s.device = d
				s.save
			end
		end
		s
	end

	def add_measurement sensors, value
		m = Measurement.new
		m.sensor_id = sensors.id
		m.value = @value
		m.save
	end

	def put_moving
		render :nothing => true

		@secret = params[:secret].to_i
		@uid = params[:uid].to_i
		@value = params[:value]

		s = get_sensor @secret, 0, @uid

		add_measurement s, @value
	end

	def put_distance
		render :nothing => true

		@secret = params[:secret].to_i
		@uid = params[:uid].to_i
		@value = params[:value]

		s = get_sensor @secret, 1, @uid

		add_measurement s, @value
	end

	def put_gas_value
		render :nothing => true

		@secret = params[:secret].to_i
		@uid = params[:uid].to_i
		@value = params[:value]

		s = get_sensor @secret, 2, @uid

		add_measurement s, @value
	end
end
