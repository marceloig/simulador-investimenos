require 'test_helper'

class RendaFixaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @renda_fixa = renda_fixas(:one)
  end
  
  test "should save RendaFixa with all required atrributes " do
    indice = Indice.create(indexador: "SELIC", taxa_de_juros: 12.0)
    renda = RendaFixa.new
    renda.titulo = "Tesouro Selic"
    renda.vencimento = "2021/01/03"
    renda.taxa_de_juros = 0.0
    renda.tipo = "Tesouro Direto"
    renda.imposto_de_renda = 0.0
    renda.has_imposto_de_renda = true
    renda.is_imposto_de_renda_fixo = false
    renda.indice = indice
    assert renda.save
  end
  
  
end
