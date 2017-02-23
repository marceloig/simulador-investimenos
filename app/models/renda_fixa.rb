class RendaFixa < ActiveRecord::Base
    belongs_to :indice
    validates :indice, absence: false
    validates :titulo,  presence: true
    validates :vencimento,  presence: true
    validates :taxa_de_juros,  presence: true
    validates :tipo,  presence: true
    validates :imposto_de_renda,  presence: true
    validates :has_imposto_de_renda, exclusion: { in: [nil] }
    validates :is_imposto_de_renda_fixo, exclusion: { in: [nil] }
    
    
end
