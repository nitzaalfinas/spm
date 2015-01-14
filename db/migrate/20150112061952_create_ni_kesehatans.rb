class CreateNiKesehatans < ActiveRecord::Migration
  def change
    create_table :ni_kesehatans do |t|
      t.integer :provinsi_id
      t.integer :kabkot_id
      t.integer :tahun

      t.timestamps null: false
    end
  end
end
