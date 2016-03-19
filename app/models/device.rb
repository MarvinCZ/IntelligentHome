class Device < ActiveRecord::Base
	enum kind: [ :movement, :distance, :gas ]
	belongs_to :user
	has_many :measurement
	validates :measurement, presence: true
	validates :kind, presence: true
end
