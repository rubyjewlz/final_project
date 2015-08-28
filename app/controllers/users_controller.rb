class UsersController < ApplicationController
	before_action :authenticate_user!
		
	def index
		@mix = Mix.order(created_at: :desc)
		@mix = Mix.new
	end

	def show
	
	end


end
