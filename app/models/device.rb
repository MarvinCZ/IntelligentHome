class Device < ActiveRecord::Base
	enum kind: [ :movement, :distance, :gas ]
	belongs_to :user
  has_many :sensors
end
