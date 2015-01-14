class AdmPenggunaController < ApplicationController

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
		total = VUser.all.size

		@users = VUser.order(ordexx).limit(rows).offset(startx)
		@user_list = @users.map do |u|
			{ 
				:id => u.id, 
				:email => u.email, 
				:level => u.level, 
				:provinsi_id => u.provinsi_id,  
				:provinsi_nama => u.provinsi_nama,
				:kabkot_id => u.kabkot_id,
				:kabkot_nama => u.kabkot_nama
			}
		end

		arrdta = {"total"=>total,"rows"=>@user_list}

		json = arrdta.to_json
		
		render json: json
	end

	def form_tambah
		render :layout => false
	end

	def form_save_insert
		@user = User.new
		@user.encrypted_password = params[:encrypted_password]
		@user.email = params[:email]
		@user.level = params[:level]
		@user.save
		render inline: "success"		
	end

	def form_edit
		id = params[:id]

		@user = VUser.where(id: id).take
		
		render :layout => false
	end

	def form_save_edit
		id = params[:id]
		
		query = "update users set level = '"+params[:level]+"' where id = "+id.to_s
		results = ActiveRecord::Base.connection.execute(query)

		render inline: "success"		
	end

	def hapus
		id = params[:id]
		Provinsi.where(id: id).destroy_all
		render inline: "success"
	end

end
