class Dapil < ActiveRecord::Base
  self.primary_key = 'dapil_id'
  has_many :perolehan_suaras
end
