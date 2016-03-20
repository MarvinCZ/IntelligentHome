class UserController < ApplicationController
  def login
  end

  def register
  end

  def show
  	@id = params[:id]
  end
  
  def device
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
    redirect_to user_device_path
  end
end
