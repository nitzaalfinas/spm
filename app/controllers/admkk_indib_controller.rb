class AdmkkIndibController < ApplicationController

	before_action :authenticate_user!

	helper_method :judul_field

	def index
		@bidang_id = params[:bidang_id]

		#jika belum ada pada tabel ni_varxes, maka bikin baru
		@varxs = Varx.where('bidang_id = ?',@bidang_id)

		##periksa jumlah, jika tidak ada, masukkan
		@varxs.each do |u|
			jumlah = NiVarx.where("bidang_id = ? and indikator_id = ? and varx_id = ? and provinsi_id = ? and kabkot_id = ?", u.bidang_id, u.indikator_id, u.id, current_user.provinsi_id, current_user.kabkot_id ).count
			if(jumlah < 1)
				time = Time.new
				query = "insert into ni_varxes (provinsi_id,kabkot_id,bidang_id,indikator_id,varx_id,created_at,updated_at) values ('"+current_user.provinsi_id.to_s+"','"+current_user.kabkot_id.to_s+"','"+u.bidang_id.to_s+"','"+u.indikator_id.to_s+"','"+u.id.to_s+"','"+time.strftime("%Y-%m-%d %H:%M:%S")+"','"+time.strftime("%Y-%m-%d %H:%M:%S")+"')"
				ActiveRecord::Base.connection.execute(query)
			end
		end #indikators

	end #index


	def grid_data
		bidang_id = params[:bidang_id]
		rows = params[:rows].to_i
		sortx = params[:sort]
		orderx = params[:order]

		#periksa apakah sudah ada data, jika belum insert dulu data default
		buat_data(bidang_id.to_i)

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
		total = VNilaiIndikator.where('provinsi_id = ? and kabkot_id = ? and bidang_id = ? ', current_user.provinsi_id, current_user.kabkot_id, bidang_id.to_i).size

		@indikators = VNilaiIndikator.where('provinsi_id = ? and kabkot_id = ? and bidang_id = ? ', current_user.provinsi_id, current_user.kabkot_id, bidang_id.to_i).order(ordexx).limit(rows).offset(startx)
		@indikator_list = @indikators.map do |u|
			{ 
				:id => u.id, 
				:bidang_id => u.bidang_id, 
				:nama_bidang => u.nama_bidang, 
				:jenis_pelayanan_id => u.jenis_pelayanan_id, 
				:jenis_pelayanan_nama => u.jenis_pelayanan_nama, 
				:indikator_id => u.indikator_id,
				:nama_indikator => u.nama_indikator,
				:nilai => u.nilai,
				:batas_waktu => u.batas_waktu
			}
		end

		arrdta = {"total"=>total,"rows"=>@indikator_list}

		json = arrdta.to_json
		
		render json: json
	end #grid_data


	def child
		@bidang_id = params[:bidang_id]
		@indikator_id = params[:indikator_id]
		#@varx_id = params[:id]
		@nivarxes = NiVarx.all
	end #child


	def child_data
		indikator_id = params[:indikator_id]

		@datas = VNiVarx.where('provinsi_id = ? and kabkot_id = ? and indikator_id = ?', current_user.provinsi_id, current_user.kabkot_id, indikator_id.to_i)
		@data_list = @datas.map do |u|
			{ 
				:id => u.id, 
				:varx_id => u.varx_id, 
				:var_nama => u.var_nama,
				:t02 => u.t02,
				:t03 => u.t03,
				:t04 => u.t04,
				:t05 => u.t05,
				:t06 => u.t06,
				:t07 => u.t07,
				:t08 => u.t08,
				:t09 => u.t09,
				:t10 => u.t10,
				:t11 => u.t11,
				:t12 => u.t12,
				:t13 => u.t13,
				:t14 => u.t14,
				:t15 => u.t15,
				:t16 => u.t16,
				:t17 => u.t17,
				:t18 => u.t18,
				:t19 => u.t19,
				:t20 => u.t20,
				:t21 => u.t21,
				:t22 => u.t22,
				:t23 => u.t23,
				:t24 => u.t24,
				:t25 => u.t25
			}
		end

		arrdta = {"rows"=>@data_list}

		json = arrdta.to_json
		
		render json: json
	end #child_data


	def child_data_update
		id = params[:id]
		@varx = NiVarx.find(id.to_i)
		@varx.t02 = params[:t02]
		@varx.t03 = params[:t03]
		@varx.t04 = params[:t04]
		@varx.t05 = params[:t05]
		@varx.t06 = params[:t06]
		@varx.t07 = params[:t07]
		@varx.t08 = params[:t08]
		@varx.t09 = params[:t09]
		@varx.t10 = params[:t10]
		@varx.t11 = params[:t11]
		@varx.t12 = params[:t12]
		@varx.t13 = params[:t13]
		@varx.t14 = params[:t14]
		@varx.t15 = params[:t15]
		@varx.t16 = params[:t16]
		@varx.t17 = params[:t17]
		@varx.t18 = params[:t18]
		@varx.t19 = params[:t19]
		@varx.t20 = params[:t20]
		@varx.t21 = params[:t21]
		@varx.t22 = params[:t22]
		@varx.t23 = params[:t23]
		@varx.t24 = params[:t24]
		@varx.t25 = params[:t25]

		@varx.save
		render inline: "success"
	end #child_data_update


	private
		def buat_data(bidang_id)
			@indikators = Indikator.where('bidang_id = ?',bidang_id)

			@indikators.each do |u|
				jumlah = VNilaiIndikator.where("bidang_id = ? and indikator_id = ? and provinsi_id = ? and kabkot_id = ?", u.bidang_id, u.id, current_user.provinsi_id, current_user.kabkot_id ).count
				if(jumlah < 1)
					time = Time.new
					query = "insert into nilai_indikators (indikator_id,provinsi_id,kabkot_id,nilai,batas_waktu,created_at,updated_at) values ('"+u.id.to_s+"','"+current_user.provinsi_id.to_s+"','"+current_user.kabkot_id.to_s+"','"+u.nilai_default.to_s+"','"+u.batas_waktu_default.to_s+"','"+time.strftime("%Y-%m-%d %H:%M:%S")+"','"+time.strftime("%Y-%m-%d %H:%M:%S")+"')"
					ActiveRecord::Base.connection.execute(query)
				end
			end
			
		end #buat_data

end
