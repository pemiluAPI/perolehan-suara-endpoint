class CreateDapils < ActiveRecord::Migration
  def change
    create_table :dapils do |t|
      t.string  :dapil_id
      t.string  :nama
      t.string  :jumlah_kursi
    end
  end
end
