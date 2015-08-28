class MixesController < ApplicationController

  #because this is an ajax create
  skip_before_filter :verify_authenticity_token

  def show
    @mix = Mix.find(params[:id])
    @tracks = @mix.tracks
  end


  def create
    mix = current_user.mixes.create

    params[:track_ids].each do |track_id|
      mix.tracks << Track.find(track_id)
    end

    render json: {id: mix.id}
  end
end
