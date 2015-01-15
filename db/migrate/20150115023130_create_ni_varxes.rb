class CreateNiVarxes < ActiveRecord::Migration
  def change
    create_table :ni_varxes do |t|
      t.integer :provinsi_id
      t.integer :kabkot_id
      t.integer :varx_id
      t.integer :nilai
      t.integer :t02
      t.integer :t03
      t.integer :t04
      t.integer :t05
      t.integer :t06
      t.integer :t07
      t.integer :t08
      t.integer :t09
      t.integer :t10
      t.integer :t11
      t.integer :t12
      t.integer :t13
      t.integer :t14
      t.integer :t15
      t.integer :t16
      t.integer :t17
      t.integer :t18
      t.integer :t19
      t.integer :t20
      t.integer :t21
      t.integer :t22
      t.integer :t23
      t.integer :t24
      t.integer :t25

      t.timestamps null: false
    end
  end
end
