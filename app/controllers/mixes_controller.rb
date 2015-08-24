class MixesController < ApplicationController

	def new
		@mix = Mix.new
	end

	def index
		@mixes = Mix.all
	end

  def create
  	@mix = Mix.create(mix_params) #TODO
  	@mix.user = current_user #depends on mix belongs_to :user in model
  	redirect_to mixes_path
  end

  private

  def mix_params
    params.require(:mix).permit(:text, :title)

  end

end
