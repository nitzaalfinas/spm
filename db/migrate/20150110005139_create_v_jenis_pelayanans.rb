class CreateVJenisPelayanans < ActiveRecord::Migration
	def up
		self.connection.execute %Q( 
			CREATE VIEW v_jenis_pelayanans AS 
			select
				jenis_pelayanans.id,
				jenis_pelayanans.bidang_id,
					bidangs.nama_bidang,
				jenis_pelayanans.jenis_pelayanan_nama,
				jenis_pelayanans.created_at,
				jenis_pelayanans.updated_at
			from
				jenis_pelayanans 
					left join bidangs on jenis_pelayanans.bidang_id = bidangs.id
	 	)
	end

	def down
		self.connection.execute "DROP VIEW IF EXISTS v_jenis_pelayanans;"
	end
end