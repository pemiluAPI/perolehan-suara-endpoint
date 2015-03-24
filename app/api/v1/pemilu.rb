module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :perolehan do
      desc "Return all provinces"
      get do
        perolehan_suara = Array.new

       # Prepare conditions based on params
        valid_params = {
          partai: 'party_id',
          dapil: 'dapil_id'
        }

        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        # Set default limit
        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 77 : params[:limit]

        PerolehanSuara.includes(:party, :dapil)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |perolehan|
            perolehan_suara << {
              id: perolehan.id,
              dapil: {
                id: perolehan.dapil_id,
                nama: perolehan.dapil.nama
              },
              partai: {
                id: perolehan.party_id,
                nama: perolehan.party.nama_lengkap
              },
              jumlah: perolehan.jumlah
            }
          end


        {
          results: {
            count: perolehan_suara.count,
            total: PerolehanSuara.where(conditions).count,
            perolehan: perolehan_suara
          }
        }
      end
    end
  end
end