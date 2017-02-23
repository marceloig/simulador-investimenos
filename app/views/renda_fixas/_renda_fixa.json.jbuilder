json.extract! renda_fixa, :id, :titulo, :vencimento, :taxa_de_juros, :tipo, :imposto_de_renda, :is_imposto_de_renda_fixo, :created_at, :updated_at
json.url renda_fixa_url(renda_fixa, format: :json)