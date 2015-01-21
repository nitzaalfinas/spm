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
  get 'adm/varxes/form_rumus_indikator/:id', to: 'adm_varx#form_rumus_indikator'
  post 'adm/varxes/form_rumus_indikator/update', to: 'adm_varx#form_rumus_indikator_update'
  


  #URL UNTUK ADMIN KABUPATEN/KOTA
  get 'admkk/panel', to: 'admkk_panel#index'  

  get 'admkk/indib', to: 'admkk_indib#index'
  get 'admkk/indib/grid_data', to: 'admkk_indib#grid_data'
  get 'admkk/indib/child', to: 'admkk_indib#child'
  get 'admkk/indib/child/data', to: 'admkk_indib#child_data'
  post 'admkk/indib/child/data_update', to: 'admkk_indib#child_data_update'

  get 'admkk/hitung', to: 'admkk_hitung#index'


end
