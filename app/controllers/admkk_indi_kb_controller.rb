class AdmkkIndiKbController < ApplicationController

	before_action :authenticate_user!

	helper_method :judul_field

	def index
		#cari semua data bidang keluarga berencana
		@indikators = Indikator.where(" bidang_id = 7 ")

		#lakukan looping data bidang keluarga berencana dan jika tidak ada data, masukkan secara otomatis
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
		total = VNilaiIndikator.where("bidang_id = 7 and provinsi_id = ? and kabkot_id = ?", current_user.provinsi_id, current_user.kabkot_id).size

		@indis = VNilaiIndikator.where("bidang_id = 7 and provinsi_id = ? and kabkot_id = ?", current_user.provinsi_id, current_user.kabkot_id).order(ordexx).limit(rows).offset(startx)
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
		#insert data sampai 2002 - 2015 (jika tidak ada)
		i = 2002

		while i < 2016
			jum = NiKb.where("provinsi_id = ? and kabkot_id = ? and tahun = ?", current_user.provinsi_id, current_user.kabkot_id, i).count

			if(jum < 1)
				query = "insert into ni_kbs (provinsi_id,kabkot_id,tahun) values ('"+current_user.provinsi_id.to_s+"','"+current_user.kabkot_id.to_s+"','"+i.to_s+"')"
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
		total = NiKb.where("provinsi_id = ? and kabkot_id = ?", current_user.provinsi_id, current_user.kabkot_id).size

		@indis = NiKb.where("provinsi_id = ? and kabkot_id = ?", current_user.provinsi_id, current_user.kabkot_id).order(ordexx).limit(rows).offset(startx)
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
				:k3_3 => uu.k3_3,

				:k4_1 => uu.k4_1,
				:k4_2 => uu.k4_2,
				:k4_3 => uu.k4_3,

				:k5_1 => uu.k5_1,
				:k5_2 => uu.k5_2,
				:k5_3 => uu.k5_3,

				:k6_1 => uu.k6_1,
				:k6_2 => uu.k6_2,
				:k6_3 => uu.k6_3,

				:k7_1 => uu.k7_1,
				:k7_2 => uu.k7_2,
				:k7_3 => uu.k7_3,

				:k8_1 => uu.k8_1,
				:k8_2 => uu.k8_2,
				:k8_3 => uu.k8_3,
				:k8_4 => uu.k8_4,
				:k8_5 => uu.k8_5,

				:k9_1 => uu.k9_1,
				:k9_2 => uu.k9_2,
				:k9_3 => uu.k9_3
		 	}
		end

		arrdta = {"total"=>total,"rows"=>@indi_list}

		json = arrdta.to_json
		
		render json: json
	end

	def child_update
		id = params[:id]
		@kk = NiKb.find(id)
		
		@kk.k1_1 = params[:k1_1]
		@kk.k1_2 = params[:k1_2]		
		@kk.k1_3 = params[:k1_3]

		@kk.k2_1 = params[:k2_1]
		@kk.k2_2 = params[:k2_2]
		@kk.k2_3 = params[:k2_3]

		@kk.k3_1 = params[:k3_1]
		@kk.k3_2 = params[:k3_2]
		@kk.k3_3 = params[:k3_3]
		
		@kk.k4_1 = params[:k4_1]
		@kk.k4_2 = params[:k4_2]
		@kk.k4_3 = params[:k4_3]

		@kk.k5_1 = params[:k5_1]
		@kk.k5_2 = params[:k5_2]
		@kk.k5_3 = params[:k5_3]
		@kk.k5_4 = params[:k5_4]
		@kk.k5_5 = params[:k5_5]

		@kk.k6_1 = params[:k6_1]
		@kk.k6_2 = params[:k6_2]
		@kk.k6_3 = params[:k6_3]

		@kk.k7_1 = params[:k7_1]
		@kk.k7_2 = params[:k7_2]
		@kk.k7_3 = params[:k7_3]

		@kk.k8_1 = params[:k8_1]
		@kk.k8_2 = params[:k8_2]
		@kk.k8_3 = params[:k8_3]
		@kk.k8_4 = params[:k8_4]
		@kk.k8_5 = params[:k8_5]

		@kk.k9_1 = params[:k9_1]
		@kk.k9_2 = params[:k9_2]
		@kk.k9_3 = params[:k9_3]
		
		@kk.save
		render inline: "success"
	end


	def judul_field(kolom)
		qb = "SELECT a.COLUMN_NAME, a.COLUMN_COMMENT FROM  information_schema.COLUMNS a WHERE a.TABLE_NAME = 'ni_kbs' and a.COLUMN_NAME = '"+kolom+"'"
		@hasils = ActiveRecord::Base.connection.execute(qb)
		@hasils.first[1]
	end #get_comment

end
