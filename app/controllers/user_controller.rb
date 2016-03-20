class UserController < ApplicationController
  def login
  end

  def register
  end

  def show
  	@id = params[:id]
  end
  
  def device
    @data = User.find_by_id(current_user.id).devices.to_json
  end
  
  def deviceDelete
    @id = params[:device][:id]
    @d = Device.find_by_id(@id)
    @d.user_id = nil
    @d.save
    redirect_to devices_path
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
