module ApplicationHelper

	#jika user adalah admin pusat, maka biarkan. Jika tidak redirect ke root
	def level_adm_pusat (user_level)
		if user_level != "adm_pusat"
			redirect_to "/"
		end
	end #def level_adm_pusat

	#jika user adalah admin kabkot, maka biarkan. Jika tidak redirect ke root
	def level_adm_kabkot (user_level)
		if user_level != "adm_kabkot"
			redirect_to "/"
		end
	end #def level_adm_kabkot

end
