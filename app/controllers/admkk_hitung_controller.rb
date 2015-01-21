class AdmkkHitungController < ApplicationController

	def index
		@rumus = Indikator.where('id = 1').take

		render inline: @rumus.rumus
	end
end
