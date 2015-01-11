class CreateJenisPelayanans < ActiveRecord::Migration
  def change
    create_table :jenis_pelayanans do |t|
      t.integer :bidang_id
      t.string :jenis_pelayanan_nama

      t.timestamps null: false
    end
  end
end
