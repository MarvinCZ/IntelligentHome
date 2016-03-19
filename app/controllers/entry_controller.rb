class EntryController < ApplicationController
  def put_moving
  	@secret = params[:secret]
  	@type = params[:type]
  	@value = params[:value]
  end
end
