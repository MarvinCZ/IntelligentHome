class DevicesController < ApplicationController
  before_filter :authenticate_user!
  def register
  	byebug
	@d = Device.find_by_secret(params[:device][:secret].to_i)
    if @d == nil
      @d = Device.new
    else
      @d.secret = params[:device][:secret].to_i
    end
    byebug
    @d.name = params[:device][:name]
    @d.user = current_user
    @d.save
    redirect_to devices_path
  end

  def remove
  	d = Device.find(params[:id])
  	if d && d.user == current_user
  		d.user = nil
  		d.save
  	end
    redirect_to devices_path
  end

  def edit
  	d = Device.find(params[:id])
  	if d && d.user == current_user
  		d.name = params[:name]
  		d.save
  	end
    redirect_to devices_path  	
  end
end
