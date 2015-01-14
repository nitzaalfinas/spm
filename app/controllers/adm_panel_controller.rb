class AdmPanelController < ApplicationController

	before_action :authenticate_user!

	layout "adm_layout"

	def index
	end
end
