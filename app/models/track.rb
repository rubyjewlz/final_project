class Track < ActiveRecord::Base
	belongs_to :mix
	belongs_to :user
end
