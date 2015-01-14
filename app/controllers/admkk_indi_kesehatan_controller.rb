class AdmkkIndiKesehatanController < ApplicationController

	before_action :authenticate_user!

	helper_method :judul_field

	def index
		#cari semua data bidang kesehatan
		@indikators = Indikator.where(" bidang_id = 1 ")

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
		total = VNilaiIndikator.where("bidang_id = 1 and provinsi_id = ? and kabkot_id = ?", current_user.provinsi_id, current_user.kabkot_id).size

		@indis = VNilaiIndikator.where("bidang_id = 1 and provinsi_id = ? and kabkot_id = ?", current_user.provinsi_id, current_user.kabkot_id).order(ordexx).limit(rows).offset(startx)
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
			jum = NiKesehatan.where("provinsi_id = ? and kabkot_id = ? and tahun = ?", current_user.provinsi_id, current_user.kabkot_id, i).count

			if(jum < 1)
				query = "insert into ni_kesehatans (provinsi_id,kabkot_id,tahun) values ('"+current_user.provinsi_id.to_s+"','"+current_user.kabkot_id.to_s+"','"+i.to_s+"')"
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
		total = NiKesehatan.where("provinsi_id = ? and kabkot_id = ?", current_user.provinsi_id, current_user.kabkot_id).size

		@indis = NiKesehatan.where("provinsi_id = ? and kabkot_id = ?", current_user.provinsi_id, current_user.kabkot_id).order(ordexx).limit(rows).offset(startx)
		@indi_list = @indis.map do |uu|
			{ 
				:id => uu.id, 
				:tahun => uu.tahun,
				:kk_pria => uu.kk_pria,
				:kk_wanita => uu.kk_wanita,
				:k1_1 => uu.k1_1,
				:k1_2 => uu.k1_2,
				:k1_2k => uu.k1_2k,
				:k1_3 => uu.k1_3,
				:k1_4 => uu.k1_4,

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
				:k5_4 => uu.k5_4,
				:k5_5 => uu.k5_5,

				:k6_1 => uu.k6_1,
				:k6_2 => uu.k6_2,
				:k6_3 => uu.k6_3,

				:k7_1 => uu.k7_1,
				:k7_2 => uu.k7_2,
				:k7_3 => uu.k7_3,

				:k8_1 => uu.k8_1,
				:k8_2 => uu.k8_2,
				:k8_3 => uu.k8_3,

				:k9_1 => uu.k9_1,
				:k9_2 => uu.k9_2,
				:k9_3 => uu.k9_3,

				:k10_1 => uu.k10_1,
				:k10_2 => uu.k10_2,
				:k10_3 => uu.k10_3,

				:k11_1 => uu.k11_1,
				:k11_2 => uu.k11_2,
				:k11_3 => uu.k11_3,

				:k12_1 => uu.k12_1,
				:k12_2 => uu.k12_2,
				:k12_3 => uu.k12_3,

				:k13_1 => uu.k13_1,
				:k13_2 => uu.k13_2,
				:k13_3 => uu.k13_3,

				:k14_1 => uu.k14_1,
				:k14_2 => uu.k14_2,
				:k14_3 => uu.k14_3,

				:k15_1 => uu.k15_1,
				:k15_2 => uu.k15_2,
				:k15_3 => uu.k15_3,

				:k16_1 => uu.k16_1,
				:k16_2 => uu.k16_2,
				:k16_3 => uu.k16_3,

				:k17_1 => uu.k17_1,
				:k17_2 => uu.k17_2,
				:k17_3 => uu.k17_3,

				:k18_1 => uu.k18_1,
				:k18_2 => uu.k18_2,
				:k18_3 => uu.k18_3,

				:k19_1 => uu.k19_1,
				:k19_2 => uu.k19_2,
				:k19_3 => uu.k19_3,

				:k20_1 => uu.k20_1,
				:k20_2 => uu.k20_2,
				:k20_3 => uu.k20_3,

				:k21_1 => uu.k21_1,
				:k21_2 => uu.k21_2,
				:k21_3 => uu.k21_3,
				
				:k22_1 => uu.k22_1,
				:k22_2 => uu.k22_2,
				:k22_3 => uu.k22_3
		 	}
		end

		arrdta = {"total"=>total,"rows"=>@indi_list}

		json = arrdta.to_json
		
		render json: json
	end

	def child_update
		id = params[:id]
		@kk = NiKesehatan.find(id)
		@kk.kk_pria = params[:kk_pria]
		@kk.kk_wanita = params[:kk_wanita]
		@kk.k1_1 = params[:k1_1]
		@kk.k1_2 = params[:k1_2]
		@kk.k1_2k = params[:k1_2k]
		@kk.k1_3 = params[:k1_3]
		@kk.k1_4 = params[:k1_4]

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

		@kk.k9_1 = params[:k9_1]
		@kk.k9_2 = params[:k9_2]
		@kk.k9_3 = params[:k9_3]

		@kk.k10_1 = params[:k10_1]
		@kk.k10_2 = params[:k10_2]
		@kk.k10_3 = params[:k10_3]

		@kk.k11_1 = params[:k11_1]
		@kk.k11_2 = params[:k11_2]
		@kk.k11_3 = params[:k11_3]

		@kk.k12_1 = params[:k12_1]
		@kk.k12_2 = params[:k12_2]
		@kk.k12_3 = params[:k12_3]

		@kk.k13_1 = params[:k13_1]
		@kk.k13_2 = params[:k13_2]
		@kk.k13_3 = params[:k13_3]
		
		@kk.k14_1 = params[:k14_1]
		@kk.k14_2 = params[:k14_2]
		@kk.k14_3 = params[:k14_3]

		@kk.k15_1 = params[:k15_1]
		@kk.k15_2 = params[:k15_2]
		@kk.k15_3 = params[:k15_3]

		@kk.k16_1 = params[:k16_1]
		@kk.k16_2 = params[:k16_2]
		@kk.k16_3 = params[:k16_3]

		@kk.k17_1 = params[:k17_1]
		@kk.k17_2 = params[:k17_2]
		@kk.k17_3 = params[:k17_3]

		@kk.k18_1 = params[:k18_1]
		@kk.k18_2 = params[:k18_2]
		@kk.k18_3 = params[:k18_3]

		@kk.k19_1 = params[:k19_1]
		@kk.k19_2 = params[:k19_2]
		@kk.k19_3 = params[:k19_3]

		@kk.k20_1 = params[:k20_1]
		@kk.k20_2 = params[:k20_2]
		@kk.k20_3 = params[:k20_3]

		@kk.k21_1 = params[:k21_1]
		@kk.k21_2 = params[:k21_2]
		@kk.k21_3 = params[:k21_3]

		@kk.k22_1 = params[:k22_1]
		@kk.k22_2 = params[:k22_2]
		@kk.k22_3 = params[:k22_3]
		
		@kk.save
		render inline: "success"
	end


	def judul_field(kolom)
		qb = "SELECT a.COLUMN_NAME, a.COLUMN_COMMENT FROM  information_schema.COLUMNS a WHERE a.TABLE_NAME = 'ni_kesehatans' and a.COLUMN_NAME = '"+kolom+"'"
		@hasils = ActiveRecord::Base.connection.execute(qb)
		@hasils.first[1]
	end #get_comment
	


end
