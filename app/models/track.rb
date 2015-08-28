class Track < ActiveRecord::Base
	has_many :mix_tracks
  has_many :mixes, through: :mix_tracks
	belongs_to :user
end
