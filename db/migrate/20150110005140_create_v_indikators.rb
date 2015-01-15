class CreateVIndikators < ActiveRecord::Migration
	def up
		self.connection.execute %Q( 
			CREATE VIEW v_indikators AS 
			select
				indikators.id,
				indikators.bidang_id,
					bidangs.nama_bidang,
				indikators.jenis_pelayanan_id,
					jenis_pelayanans.jenis_pelayanan_nama,
				indikators.nama_indikator,
				indikators.nilai_default,
				indikators.batas_waktu_default,
				indikators.rumus
			from
				indikators 
					left join bidangs on indikators.bidang_id = bidangs.id
					left join jenis_pelayanans on indikators.jenis_pelayanan_id = jenis_pelayanans.id
	 	)
	end

	def down
		self.connection.execute "DROP VIEW IF EXISTS v_indikators;"
	end
end