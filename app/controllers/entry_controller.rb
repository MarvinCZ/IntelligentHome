class EntryController < ApplicationController
  def put_moving
  	@secret = params[:secret]
		@kind = params[:kind]
  	@value = params[:value]
		
		u = User.find_by_secret(@secret)
		d = u.device.find_by_kind(@kind)
		m = Measurement.new
		m.device_id = d.id
		m.value = @value
		m.save
  end
end
