class MixTrack < ActiveRecord::Base
  belongs_to :mix
  belongs_to :track
end
