class AdmPanelController < ApplicationController

	before_action :authenticate_user!

	include ApplicationHelper

	layout "adm_layout"

	def index
		level_adm_pusat current_user.level
	end
end
