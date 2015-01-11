class AdmKabkotController < ApplicationController

	def grid
		render :layout => false
	end

	def grid_data
		rows = params[:rows].to_i
		sortx = params[:sort]
		orderx = params[:order]

		#mencari offset
		if(!params[:page])
			page = 1
		else
			page = params[:page].to_i
		end

		startx = (page - 1) * rows

		#ordering (jika parameter sortx ada, maka ini dijalankan)
		if(sortx)
			ordexx = sortx+" "+orderx
		else 
			orderxx = "id desc"
		end

		#semua data
		total = VKabkot.all.size

		@kabkots = VKabkot.order(ordexx).limit(rows).offset(startx)
		@kabkot_list = @kabkots.map do |u|
			{ :provinsi_id => u.provinsi_id, :provinsi_nama => u.provinsi_nama, :id => u.id, :kabkot_nama => u.kabkot_nama }
		end

		arrdta = {"total"=>total,"rows"=>@kabkot_list}

		json = arrdta.to_json
		
		render json: json
	end

	def form
		id = params[:id]

		if(id == "0")
			kk = VKabkot.new
			kk.id = 0
			@kabkot = kk
			puts @kabkot
		else
			@kabkot = VKabkot.where(id: id).take
		end
		render :layout => false
	end

	def form_save
		id = params[:id]
		@kabkot = Kabkot.where(id: id).take

		if (@kabkot != nil)
			#update
			@kabkot.provinsi_id = params[:provinsi_id]
			@kabkot.id = params[:id]
			@kabkot.kabkot_nama = params[:kabkot_nama]
			@kabkot.save
		else
			#insert
			@kn = Kabkot.new
			@kn.provinsi_id = params[:provinsi_id]
			@kn.id = params[:id]
			@kn.kabkot_nama = params[:kabkot_nama]
			@kn.save
		end

		render inline: "success"		
	end

	def hapus
		id = params[:id]
		Kabkot.where(id: id).destroy_all
		render inline: "success"
	end
end
