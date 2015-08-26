class MixesController < ApplicationController

	def show
		@mixes = Mix.find(params[:id])
	end

	def new
		@mix = Mix.new
	end

	def index
		@mixes = Mix.all
	end

  def create
  	@mix = Mix.create(mix_params) #TODO
  	@mix.user = current_user #depends on mix belongs_to :user in model
  	@mix.save
  	redirect_to mixes_path
  end

def edit
	@mix = Mix.find(params[:id])
end

def destroy
	@mixes = Mix.find(params[:id])
	if current_user.blank? or @mixes.user != current_user
		flash[:alert] = 'unauthorized deletion attempt'
		redirect_to mixes_path
	else
		@mixes.destroy
		redirect_to mixes_path
	end
end

  private

  def mix_params
    params.require(:mix).permit(:text, :title)

  end

end
