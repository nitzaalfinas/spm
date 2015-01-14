class CreateVNilaiIndikators < ActiveRecord::Migration

	def up
		self.connection.execute %Q( 
			CREATE OR REPLACE VIEW v_nilai_indikators AS
			select
				a.id,

					v_indikators.bidang_id,
					v_indikators.nama_bidang,
					v_indikators.jenis_pelayanan_id,
					v_indikators.jenis_pelayanan_nama,
				a.indikator_id,
					v_indikators.nama_indikator,

				a.provinsi_id,
					provinsis.provinsi_nama,
				a.kabkot_id,
					kabkots.kabkot_nama,
				a.nilai,
				a.batas_waktu
			from 
			    nilai_indikators a
			    	left join v_indikators on a.indikator_id = v_indikators.id 
			    	left join provinsis on a.provinsi_id = provinsis.id
			    	left join kabkots on a.kabkot_id = kabkots.id;	
	 	)
	end

	def down
		self.connection.execute "DROP VIEW IF EXISTS v_nilai_indikators;"
	end
  
end