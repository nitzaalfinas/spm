class AdmkkIndiPeraController < ApplicationController

	before_action :authenticate_user!

	helper_method :judul_field

	def index
		#cari semua data bidang kesehatan
		@indikators = Indikator.where(" bidang_id = 5 ")

		#lakukan looping data bidang kesehatan dan jika tidak ada data, masukkan secara otomatis
		@indikators.each do |u|
			jumlah = NilaiIndikator.where("indikator_id = ? and provinsi_id = ? and kabkot_id = ?", u.id, current_user.provinsi_id, current_user.kabkot_id ).count
			if(jumlah < 1)
				query = "insert into nilai_indikators (indikator_id,provinsi_id,kabkot_id,nilai,batas_waktu) values ('"+u.id.to_s+"','"+current_user.provinsi_id.to_s+"','"+current_user.kabkot_id.to_s+"','"+u.nilai_default.to_s+"','"+u.batas_waktu_default.to_s+"')"
				ActiveRecord::Base.connection.execute(query)
			end
		end
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
		total = VNilaiIndikator.where("bidang_id = 5 and provinsi_id = ? and kabkot_id = ?", current_user.provinsi_id, current_user.kabkot_id).size

		@indis = VNilaiIndikator.where("bidang_id = 5 and provinsi_id = ? and kabkot_id = ?", current_user.provinsi_id, current_user.kabkot_id).order(ordexx).limit(rows).offset(startx)
		@indi_list = @indis.map do |u|
			{ 
				:id => u.id, 
				:bidang_id => u.bidang_id,
				:nama_bidang => u.nama_bidang,
				:jenis_pelayanan_id => u.jenis_pelayanan_id,
				:jenis_pelayanan_nama => u.jenis_pelayanan_nama,
				:indikator_id => u.indikator_id,
				:nama_indikator => u.nama_indikator,
				:provinsi_id => u.provinsi_id,
				:provinsi_nama => u.provinsi_nama,
				:kabkot_id => u.kabkot_id,
				:kabkot_nama => u.kabkot_nama,
				:nilai => u.nilai,
				:batas_waktu => u.batas_waktu
		 	}
		end

		arrdta = {"total"=>total,"rows"=>@indi_list}

		json = arrdta.to_json
		
		render json: json
	end

	def grid_child
		#insert data sampai 2002 - 2025 (jika tidak ada)
		i = 2002

		while i < 2026
			jum = NiPera.where("provinsi_id = ? and kabkot_id = ? and tahun = ?", current_user.provinsi_id, current_user.kabkot_id, i).count

			if(jum < 1)
				query = "insert into ni_peras (provinsi_id,kabkot_id,tahun) values ('"+current_user.provinsi_id.to_s+"','"+current_user.kabkot_id.to_s+"','"+i.to_s+"')"
				ActiveRecord::Base.connection.execute(query)
			end

			i = i +1
		end #while		

		@indikator_id = params[:indikator_id]

		render :layout => false
	end #grid_child


	def child_data
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
		total = NiPera.where("provinsi_id = ? and kabkot_id = ?", current_user.provinsi_id, current_user.kabkot_id).size

		@indis = NiPera.where("provinsi_id = ? and kabkot_id = ?", current_user.provinsi_id, current_user.kabkot_id).order(ordexx).limit(rows).offset(startx)
		@indi_list = @indis.map do |uu|
			{ 
				:id => uu.id, 
				:tahun => uu.tahun,

				:k1_1 => uu.k1_1,
				:k1_2 => uu.k1_2,
				:k1_3 => uu.k1_3,

				:k2_1 => uu.k2_1,
				:k2_2 => uu.k2_2,
				:k2_3 => uu.k2_3,

				:k3_1 => uu.k3_1,
				:k3_2 => uu.k3_2,
				:k3_3 => uu.k3_3
		 	}
		end

		arrdta = {"total"=>total,"rows"=>@indi_list}

		json = arrdta.to_json
		
		render json: json
	end #child_data

	def child_update
		id = params[:id]
		@kk = NiPera.find(id)
		
		@kk.k1_1 = params[:k1_1]
		@kk.k1_2 = params[:k1_2]
		@kk.k1_3 = params[:k1_3]

		@kk.k2_1 = params[:k2_1]
		@kk.k2_2 = params[:k2_2]
		@kk.k2_3 = params[:k2_3]

		@kk.k3_1 = params[:k3_1]
		@kk.k3_2 = params[:k3_2]
		@kk.k3_3 = params[:k3_3]
		
		@kk.save
		render inline: "success"
	end


	def judul_field(kolom)
		qb = "SELECT a.COLUMN_NAME, a.COLUMN_COMMENT FROM  information_schema.COLUMNS a WHERE a.TABLE_NAME = 'ni_peras' and a.COLUMN_NAME = '"+kolom+"'"
		@hasils = ActiveRecord::Base.connection.execute(qb)
		@hasils.first[1]
	end #get_comment
end
