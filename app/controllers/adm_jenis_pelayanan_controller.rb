class AdmJenisPelayananController < ApplicationController

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
		total = VJenisPelayanan.all.size

		@jepels = VJenisPelayanan.order(ordexx).limit(rows).offset(startx)
		@jepel_list = @jepels.map do |u|
			{ :id => u.id, :bidang_id => u.bidang_id, :nama_bidang => u.nama_bidang, :jenis_pelayanan_nama => u.jenis_pelayanan_nama }
		end

		arrdta = {"total"=>total,"rows"=>@jepel_list}

		json = arrdta.to_json
		
		render json: json
	end

	def form
		id = params[:id]

		@bidangs = Bidang.all

		if(id == "0")
			kk = VJenisPelayanan.new
			kk.id = 0
			@jepel = kk
			puts @jepel
		else
			@jepel = VJenisPelayanan.where(id: id).take
		end
		render :layout => false
	end

	def form_create
		kk = JenisPelayanan.new
		kk.bidang_id = params[:bidang_id]
		kk.jenis_pelayanan_nama = params[:jenis_pelayanan_nama]
		kk.save
		render inline: "success"
	end

	def form_update
		id = params[:id].to_i
		kk = JenisPelayanan.where(id: id).take
		kk.bidang_id = params[:bidang_id]
		kk.jenis_pelayanan_nama = params[:jenis_pelayanan_nama]
		kk.save
		render inline: "success"
	end

	def hapus
		id = params[:id]
		JenisPelayanan.where(id: id).destroy_all
		render inline: "success"
	end

end
