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

		@datas = NiVarx.where('provinsi_id = ? and kabkot_id = ? and indikator_id = ?', current_user.provinsi_id, current_user.kabkot_id, indikator_id.to_i)
		@data_list = @datas.map do |u|
			{ 
				:id => u.id, 
				:varx_id => u.varx_id, 
				:nilai => u.nilai
			}
		end

		arrdta = {"rows"=>@data_list}

		json = arrdta.to_json
		
		render json: json
	end #child_data

end
