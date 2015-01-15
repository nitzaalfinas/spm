class CreateVarxes < ActiveRecord::Migration
  def change
    create_table :varxes do |t|
      t.integer :indikator_id
      t.string :var_nama
      t.string :keterangan

      t.timestamps null: false
    end
  end
end
