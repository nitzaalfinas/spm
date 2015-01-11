class AdmBidangController < ApplicationController

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
		total = Bidang.all.size

		@bidangs = Bidang.order(ordexx).limit(rows).offset(startx)
		@bidang_list = @bidangs.map do |u|
			{ :id => u.id, :nama_bidang => u.nama_bidang }
		end

		arrdta = {"total"=>total,"rows"=>@bidang_list}

		json = arrdta.to_json
		
		render json: json
	end

	def form
		id = params[:id]
		if(id == "0")
			kk = Bidang.new
			kk.id = 0
			@bidang = kk
			puts @bidang
		else
			@bidang = Bidang.where(id: id).take
		end
		render :layout => false
	end

	def form_create
		kk = Bidang.new
		kk.nama_bidang = params[:nama_bidang]
		kk.save
		render inline: "success"
	end

	def form_update
		id = params[:id].to_i
		kk = Bidang.where(id: id).take
		kk.nama_bidang = params[:nama_bidang]
		kk.save
		render inline: "success"
	end

	def hapus
		id = params[:id]
		Bidang.where(id: id).destroy_all
		render inline: "success"
	end

end
