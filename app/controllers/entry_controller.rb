class EntryController < ApplicationController
  def put_moving
	@secret = params[:secret].to_i
	@kind = params[:kind]
  	@value = params[:value]
		
	u = User.find_by_secret(@secret)
	return if u == nil
	d = u.devices.find_by_kind(@kind)
	return if d == nil
	m = Measurement.new
	m.device_id = d.id
	m.value = @value
	m.save

	render :nothing => true
  end
end
