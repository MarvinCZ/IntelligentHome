class EntryController < ApplicationController
  def put_moving
    @secret = params[:secret].to_i
    @kind = params[:kind]
    @value = params[:value]

    d = Device.find_by_secret(@secret)
    return if d == nil
    s = d.sensors.find_by_kind(@kind)
    return if s == nil
    m = Measurement.new
    m.sensor_id = s.id
    m.value = @value
    m.save

    render :nothing => true
  end
end
