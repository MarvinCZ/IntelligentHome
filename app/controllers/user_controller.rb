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
end
