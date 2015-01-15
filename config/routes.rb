Rails.application.routes.draw do
  
  devise_for :users



  #HALAMAN ADMINISTRASI UNTUK ADMIN PUSAT
  get 'adm/panel', to: 'adm_panel#index'  

  get 'adm/penggunas', to: 'adm_pengguna#grid'
  get 'adm/penggunas/grid/data', to: 'adm_pengguna#grid_data'
  get 'adm/penggunas/form/tambah', to: 'adm_pengguna#form_tambah'
  post 'adm/penggunas/form/save_insert', to: 'adm_pengguna#form_save_insert'
  get 'adm/penggunas/form/:id', to: 'adm_pengguna#form_edit'
  post 'adm/penggunas/form/save_edit', to: 'adm_pengguna#form_save_edit'
  post 'adm/penggunas/hapus/:id', to: 'adm_pengguna#hapus'

  get 'adm/provinsis', to: 'adm_provinsi#grid'
  get 'adm/provinsis/grid/data', to: 'adm_provinsi#grid_data'
  get 'adm/provinsis/form/:id', to: 'adm_provinsi#form'
  post 'adm/provinsis/form/save', to: 'adm_provinsi#form_save'
  post 'adm/provinsis/hapus/:id', to: 'adm_provinsi#hapus'

  get 'adm/kabkots', to: 'adm_kabkot#grid'
  get 'adm/kabkots/grid/data', to: 'adm_kabkot#grid_data'
  get 'adm/kabkots/form/:id', to: 'adm_kabkot#form'
  post 'adm/kabkots/form/save', to: 'adm_kabkot#form_save'
  post 'adm/kabkots/hapus/:id', to: 'adm_kabkot#hapus'

  get 'adm/bidangs', to: 'adm_bidang#grid'
  get 'adm/bidangs/grid/data', to: 'adm_bidang#grid_data'
  get 'adm/bidangs/form/:id', to: 'adm_bidang#form'
  post 'adm/bidangs/form/create', to: 'adm_bidang#form_create'
  post 'adm/bidangs/form/update', to: 'adm_bidang#form_update'
  post 'adm/bidangs/hapus/:id', to: 'adm_bidang#hapus'

  get 'adm/jenis_pelayanans', to: 'adm_jenis_pelayanan#grid'
  get 'adm/jenis_pelayanans/grid/data', to: 'adm_jenis_pelayanan#grid_data'
  get 'adm/jenis_pelayanans/form/:id', to: 'adm_jenis_pelayanan#form'
  post 'adm/jenis_pelayanans/form/create', to: 'adm_jenis_pelayanan#form_create'
  post 'adm/jenis_pelayanans/form/update', to: 'adm_jenis_pelayanan#form_update'
  post 'adm/jenis_pelayanans/hapus/:id', to: 'adm_jenis_pelayanan#hapus'

  get 'adm/indikators', to: 'adm_indikator#grid'
  get 'adm/indikators/grid/data', to: 'adm_indikator#grid_data'
  get 'adm/indikators/form/:id', to: 'adm_indikator#form'
  post 'adm/indikators/form/create', to: 'adm_indikator#form_create'
  post 'adm/indikators/form/update', to: 'adm_indikator#form_update'
  post 'adm/indikators/hapus/:id', to: 'adm_indikator#hapus'
  get 'adm/indikators/opt_jenis_pelayanan', to: 'adm_indikator#opt_jenis_pelayanan'

  get 'adm/varxes', to: 'adm_varx#grid'
  get 'adm/varxes/grid/data', to: 'adm_varx#grid_data'
  get 'adm/varxes/child', to: 'adm_varx#child'
  get 'adm/varxes/child/data', to: 'adm_varx#child_data'
  post 'adm/varxes/child/data_insert', to: 'adm_varx#child_data_insert'
  post 'adm/varxes/child/data_update', to: 'adm_varx#child_data_update'
  post 'adm/varxes/child/data_destroy', to: 'adm_varx#child_data_destroy'
  


  #URL UNTUK ADMIN KABUPATEN/KOTA
  get 'admkk/panel', to: 'admkk_panel#index'  

  #1
  get 'admkk/indi/kesehatan', to: 'admkk_indi_kesehatan#index'
  get 'admkk/indi/kesehatan/grid_data', to: 'admkk_indi_kesehatan#grid_data'
  get 'admkk/indi/kesehatan/grid_data/child', to: 'admkk_indi_kesehatan#grid_child'
  get 'admkk/indi/kesehatan/grid_data/child_data', to: 'admkk_indi_kesehatan#child_data'
  post 'admkk/indi/kesehatan/grid_data/child_update', to: 'admkk_indi_kesehatan#child_update'

  #2
  get 'admkk/indi/sos', to: 'admkk_indi_sos#index'
  get 'admkk/indi/sos/grid_data', to: 'admkk_indi_sos#grid_data'
  get 'admkk/indi/sos/grid_data/child', to: 'admkk_indi_sos#grid_child'
  get 'admkk/indi/sos/grid_data/child_data', to: 'admkk_indi_sos#child_data'
  post 'admkk/indi/sos/grid_data/child_update', to: 'admkk_indi_sos#child_update'

  #3
  get 'admkk/indi/lh', to: 'admkk_indi_lh#index'
  get 'admkk/indi/lh/grid_data', to: 'admkk_indi_lh#grid_data'
  get 'admkk/indi/lh/grid_data/child', to: 'admkk_indi_lh#grid_child'
  get 'admkk/indi/lh/grid_data/child_data', to: 'admkk_indi_lh#child_data'
  post 'admkk/indi/lh/grid_data/child_update', to: 'admkk_indi_lh#child_update'

  #4
  get 'admkk/indi/pdn', to: 'admkk_indi_pdn#index'
  get 'admkk/indi/pdn/grid_data', to: 'admkk_indi_pdn#grid_data'
  get 'admkk/indi/pdn/grid_data/child', to: 'admkk_indi_pdn#grid_child'
  get 'admkk/indi/pdn/grid_data/child_data', to: 'admkk_indi_pdn#child_data'
  post 'admkk/indi/pdn/grid_data/child_update', to: 'admkk_indi_pdn#child_update'

  #5
  get 'admkk/indi/pera', to: 'admkk_indi_pera#index'
  get 'admkk/indi/pera/grid_data', to: 'admkk_indi_pera#grid_data'
  get 'admkk/indi/pera/grid_data/child', to: 'admkk_indi_pera#grid_child'
  get 'admkk/indi/pera/grid_data/child_data', to: 'admkk_indi_pera#child_data'
  post 'admkk/indi/pera/grid_data/child_update', to: 'admkk_indi_pera#child_update'

  #7
  get 'admkk/indi/kb', to: 'admkk_indi_kb#index'
  get 'admkk/indi/kb/grid_data', to: 'admkk_indi_kb#grid_data'
  get 'admkk/indi/kb/grid_data/child', to: 'admkk_indi_kb#grid_child'
  get 'admkk/indi/kb/grid_data/child_data', to: 'admkk_indi_kb#child_data'
  post 'admkk/indi/kb/grid_data/child_update', to: 'admkk_indi_kb#child_update'

end
