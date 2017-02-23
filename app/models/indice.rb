class Indice < ActiveRecord::Base
    has_many :renda_fixa
    validates :indexador,  presence: true
    validates :taxa_de_juros, presence: true
end
