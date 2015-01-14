class AdmkkPanelController < ApplicationController

	before_action :authenticate_user!

	layout "admkk_layout"

	def index
	end

end
