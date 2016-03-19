class Device < ActiveRecord::Base
	enum kind: [ :movement, :distance, :gas ]
	belongs_to :user
  validates :user, presence: true
	has_many :measurements
	validates :kind, presence: true
end
