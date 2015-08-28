class Mix < ActiveRecord::Base
	belongs_to :user
  has_many :mix_tracks
	has_many :tracks, through: :mix_tracks
end
