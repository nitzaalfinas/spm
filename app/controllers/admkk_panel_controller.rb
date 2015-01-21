class AdmkkPanelController < ApplicationController

	before_action :authenticate_user!

	include ApplicationHelper

	layout "admkk_layout"

	def index
		level_adm_kabkot current_user.level
	end

end
