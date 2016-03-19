class DashboardController < ApplicationController
  def show
    @d = User.first.devices
  end
end
