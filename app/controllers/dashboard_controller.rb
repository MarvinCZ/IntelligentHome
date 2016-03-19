class DashboardController < ApplicationController
  before_filter :authenticate_user!, only: [:show]
  
  def show
    # @d = User.first.devices
    @d = User.first.devices
    @d.each do |d|
      (@m ||= []).push(d.measurements.as_json())
    end
    @d = @d.as_json()
  end
end
