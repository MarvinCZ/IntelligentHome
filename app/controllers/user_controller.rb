class UserController < ApplicationController
  def login
  end

  def register
  end

  def show
  	@id = params[:id]
  end
  
  def device
    @dev = Device.new
  end
  
  def device_register
    @d = Device.find_by_secret(params[:device => [:secret]].to_i)
    if @d == null
      @d = Device.new
    else
      @d.secret = params[:device => [:secret]].to_i
    end
    @d.name = params[:device => [:name]]
    @d.user = current_user
    @d.save
    redirect_to devices_path
  end
end
