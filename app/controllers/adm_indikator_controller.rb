class AdmIndikatorController < ApplicationController

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
		total = VIndikator.all.size

		#@indikators = VIndikator.order(ordexx).limit(rows).offset(startx)
		@indikators = VIndikator.order("id asc").limit(rows).offset(startx)
		@indikator_list = @indikators.map do |u|
			{ 
				:id => u.id, 
				:bidang_id => u.bidang_id, 
				:nama_bidang => u.nama_bidang, 
				:jenis_pelayanan_id => u.jenis_pelayanan_id, 
				:jenis_pelayanan_nama => u.jenis_pelayanan_nama, 
				:nama_indikator => u.nama_indikator,
				:nilai_default => u.nilai_default,
				:batas_waktu_default => u.batas_waktu_default
			}
		end

		arrdta = {"total"=>total,"rows"=>@indikator_list}

		json = arrdta.to_json
		
		render json: json
	end

	def form
		id = params[:id]

		@bidangs = Bidang.all #sisipkan untuk select
		@jepels = JenisPelayanan.all #sisipkan untuk select

		if(id == "0")
			kk = Indikator.new
			kk.id = 0
			@indikator = kk
			puts @indikator
		else
			@indikator = Indikator.where(id: id).take
		end
		render :layout => false
	end

	def form_create
		kk = Indikator.new
		kk.bidang_id = params[:bidang_id]
		kk.jenis_pelayanan_id = params[:jenis_pelayanan_id]
		kk.nama_indikator = params[:nama_indikator]
		kk.nilai_default = params[:nilai_default]
		kk.batas_waktu_default = params[:batas_waktu_default]
		kk.save
		render inline: "success"
	end

	def form_update
		id = params[:id].to_i
		kk = Indikator.where(id: id).take
		kk.bidang_id = params[:bidang_id]
		kk.jenis_pelayanan_id = params[:jenis_pelayanan_id]
		kk.nama_indikator = params[:nama_indikator]
		kk.nilai_default = params[:nilai_default]
		kk.batas_waktu_default = params[:batas_waktu_default]
		kk.save
		render inline: "success"
	end

	def hapus
		id = params[:id]
		Indikator.where(id: id).destroy_all
		render inline: "success"
	end

	def opt_jenis_pelayanan
		bidang_id = params[:bidang_id]
		@jepels = JenisPelayanan.where(bidang_id: bidang_id)
	end
end
