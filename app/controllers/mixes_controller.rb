class MixesController < ApplicationController

	def index
		@mixes = Mix.order(created_at: :desc)
		@mix = Mix.new
	end

	def show
		@mixes = Mix.find(params[:id])
	end

	def new
		@mix = Mix.new
	end

	def edit
	@mix = Mix.find(params[:id])
	end

	def create
		@mix = Mix.new(mix_params)
		@mix.user = current_user
		@mix.save
		redirect_to mixes_path
	end

	def update
		@mixes = Mix.find(params[:id])
		if @mixes.update(mix_params)
		redirect_to mixes_path
		else
		render 'edit'
		end
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
