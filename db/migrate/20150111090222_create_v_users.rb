class CreateVUsers < ActiveRecord::Migration

	def up
		self.connection.execute %Q( 
			CREATE OR REPLACE VIEW v_users AS
			select
				users.id,
			    users.email,
			    users.level,
			    users.provinsi_id,
			    	provinsis.provinsi_nama,
			    users.kabkot_id,
			    	kabkots.kabkot_nama,
			    users.full_name,
			    users.encrypted_password,
			    users.reset_password_token,
			    users.reset_password_sent_at,
			    users.remember_created_at,
			    users.sign_in_count,
			    users.current_sign_in_at,
			    users.last_sign_in_at,
			    users.current_sign_in_ip,
			    users.last_sign_in_ip
			from 
			    users
			        left join provinsis on users.provinsi_id = provinsis.id
			        left join kabkots on users.kabkot_id = kabkots.id;	
	 	)
	end

	def down
		self.connection.execute "DROP VIEW IF EXISTS v_users;"
	end
  
end