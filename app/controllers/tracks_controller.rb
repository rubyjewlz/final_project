class TracksController < ApplicationController
	def new
		@track = Track.new
	end

	def create
		@track = Track.create(track_params)
  	# @track.user = current_user 
  	@track.save
  	redirect_to tracks_path
	end

	def show
	end

	def index
		@tracks = Track.all
	end

	private

  def track_params
    params.require(:track).permit(:url)
  end
end
