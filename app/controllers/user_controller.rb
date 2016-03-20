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
  
  def deviceRegister
    @name = params[:name]
    @secret = params[:secret]
    @id = current_user.id
    @d = Device.new
    @d.user_id = @id
    @d.secret = @secret.to_i
    @d.name = @name
    @d.save
    redirect_to devices_path
  end
end
