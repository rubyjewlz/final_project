class TracksController < ApplicationController

	def index
		@tracks = Track.order(created_at: :desc)
		@track = Track.new
	end

	def show
		@track = Track.find(params[:id])
	end

	def new
		@track = Track.new
	end

	def edit
    @track = Track.find(params[:id])
	end

	def create
		@track = Track.new(track_params)
		@track.user = current_user
		@track.save
		redirect_to tracks_path
	end

	def update
		@track = track.find(params[:id])
		if @track.update(track_params)
		redirect_to track_path(@track)
		else
		render 'edit'
		end
	end

def destroy
	@track = track.find(params[:id])
	if current_user.blank? or @track.user != current_user
		flash[:alert] = 'unauthorized deletion attempt'
		redirect_to tracks_path
	else
		@track.destroy
		redirect_to tracks_path
	end
end

  private

  def track_params
    params.require(:track).permit(:url)
  end

end
