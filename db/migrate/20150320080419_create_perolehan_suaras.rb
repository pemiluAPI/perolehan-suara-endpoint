class CreatePerolehanSuaras < ActiveRecord::Migration
  def change
    create_table :perolehan_suaras do |t|
      t.string  :dapil_id
      t.string  :party_id
      t.string  :jumlah
    end

    add_index :perolehan_suaras, [:dapil_id, :party_id]
  end
end
