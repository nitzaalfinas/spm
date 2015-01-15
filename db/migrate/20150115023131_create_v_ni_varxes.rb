class CreateVNiVarxes < ActiveRecord::Migration

	def up
		self.connection.execute %Q( 
			CREATE OR REPLACE VIEW v_ni_varxes AS
			select
				ni_varxes.id,
				ni_varxes.provinsi_id,
				ni_varxes.kabkot_id,
				ni_varxes.bidang_id,
					bidangs.nama_bidang,
				ni_varxes.indikator_id,
					indikators.nama_indikator,
				ni_varxes.varx_id,
					varxes.var_nama,
					varxes.satuan,
				t02,
				t03,
				t04,
				t05,
				t06,
				t07,
				t08,
				t09,
				t10,
				t11,
				t12,
				t13,
				t14,
				t15,
				t16,
				t17,
				t18,
				t19,
				t20,
				t21,
				t22,
				t23,
				t24,
				t25
			from 
			    ni_varxes 
			    	left join bidangs on ni_varxes.bidang_id = bidangs.id 
			    	left join indikators on ni_varxes.indikator_id = indikators.id 
			    	left join varxes on ni_varxes.varx_id = varxes.id
			    ;	
	 	)
	end

	def down
		self.connection.execute "DROP VIEW IF EXISTS v_ni_varxes;"
	end
  
end