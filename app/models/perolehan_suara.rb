class PerolehanSuara < ActiveRecord::Base
  belongs_to  :dapil
  belongs_to  :party
end
