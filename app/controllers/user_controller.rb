class UserController < ApplicationController
  def login
  end

  def register
  end

  def show
  	@id = params[:id]
  end
end
