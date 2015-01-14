class AdmProvinsiController < ApplicationController

	before_action :authenticate_user!

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
		total = Provinsi.all.size

		@provinsis = Provinsi.order(ordexx).limit(rows).offset(startx)
		@provinsi_list = @provinsis.map do |u|
			{ :id => u.id, :provinsi_nama => u.provinsi_nama }
		end

		arrdta = {"total"=>total,"rows"=>@provinsi_list}

		json = arrdta.to_json
		
		render json: json
	end

	def form
		id = params[:id]

		if(id == "0")
			kk = Provinsi.new
			kk.id = 0
			@provinsi = kk
			puts @provinsi
		else
			@provinsi = Provinsi.where(id: id).take
		end
		render :layout => false
	end

	def form_save
		id = params[:id]
		@provinsi = Provinsi.where(id: id).take

		if (@provinsi != nil)
			#update
			@provinsi.provinsi_nama = params[:provinsi_nama]
			@provinsi.save
		else
			#insert
			@kn = Provinsi.new
			@kn.id = params[:id]
			@kn.provinsi_nama = params[:provinsi_nama]
			@kn.save
		end

		render inline: "success"		
	end

	def hapus
		id = params[:id]
		Provinsi.where(id: id).destroy_all
		render inline: "success"
	end
end
