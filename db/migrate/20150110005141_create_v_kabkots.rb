class CreateVKabkots < ActiveRecord::Migration

	def up
		self.connection.execute %Q( 
			CREATE OR REPLACE VIEW v_kabkots AS
			select
			    provinsis.jw,
			    kabkots.provinsi_id,
			    provinsis.provinsi_nama,
			    kabkots.id,
			    kabkots.kabkot_nama
			from 
			    kabkots
			        left join provinsis on kabkots.provinsi_id = provinsis.id;	
	 	)
	end

	def down
		self.connection.execute "DROP VIEW IF EXISTS v_kabkots;"
	end
  
end