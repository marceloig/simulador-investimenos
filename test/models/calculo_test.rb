require 'test_helper'

class CalculoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @renda_fixa_pre_fixado = renda_fixas(:testePreFixado)
    @selic = renda_fixas(:selic)
    @selic_com_juros_e_imposto_de_renda = renda_fixas(:selic_com_juros_e_imposto_de_renda)
    @cdb1ano = renda_fixas(:cdb1ano)
    @cdb2ano = renda_fixas(:cdb2ano)
    
    @indiceSelic = indices(:indiceSelic)
    @indiceCdi = indices(:indiceCdi)
    
    @selic.indice = @indiceSelic
    @selic_com_juros_e_imposto_de_renda.indice = @indiceSelic
    @cdb1ano.indice = @indiceCdi
    @cdb2ano.indice = @indiceCdi
  end
  
  test "teste calculo renda fixa pre-fixado com taxa de 12% com retirada antes e no vencimento e com e sem valor mensal" do
    calculo = Calculo.new(valor_inicial:500.0, valor_mensal: 0.0, data_de_retirada: Date.today.next_year(5), renda_fixa: @renda_fixa_pre_fixado)
    rendimento = calculo.calcularRendimento
    assert_equal(881.76, rendimento.valor_bruto)
    
    calculo = Calculo.new(valor_inicial:500.0, valor_mensal: 500.0, data_de_retirada: Date.today.next_year(5), renda_fixa: @renda_fixa_pre_fixado)
    rendimento = calculo.calcularRendimento
    assert_equal(41066.81, rendimento.valor_bruto)
    
    calculo = Calculo.new(valor_inicial:500.0, valor_mensal: 0.0, renda_fixa: @renda_fixa_pre_fixado)
    rendimento = calculo.calcularRendimento
    assert_equal(2425.08, rendimento.valor_bruto)
    
    calculo = Calculo.new(valor_inicial:500.0, valor_mensal: 500.0, renda_fixa: @renda_fixa_pre_fixado)
    rendimento = calculo.calcularRendimento
    assert_equal(205065.03, rendimento.valor_bruto)
  end
  
  test "teste calculo renda fixa Selic com taxa selic com retirada antes e no vencimento e com e sem valor mensal e com desconto de IR" do
    calculo = Calculo.new(valor_inicial:1000.0, valor_mensal: 0.0, data_de_retirada: Date.today.next_year(1), renda_fixa: @selic)
    rendimento = calculo.calcularRendimento
    assert_equal(1122.82, rendimento.valor_bruto)
    
    calculo = Calculo.new(valor_inicial:1000.0, valor_mensal: 100.0, data_de_retirada: Date.today.next_year(1), renda_fixa: @selic)
    rendimento = calculo.calcularRendimento
    assert_equal(2388.95, rendimento.valor_bruto)
    
    calculo = Calculo.new(valor_inicial:1000.0, valor_mensal: 0.0, renda_fixa: @selic)
    rendimento = calculo.calcularRendimento
    assert_equal(2003.78, rendimento.valor_bruto)
    
    calculo = Calculo.new(valor_inicial:1000.0, valor_mensal: 100.0, renda_fixa: @selic)
    rendimento = calculo.calcularRendimento
    assert_equal(12352.01, rendimento.valor_bruto)
    
    calculo = Calculo.new(valor_inicial:1000.0, valor_mensal: 100.0, renda_fixa: @selic_com_juros_e_imposto_de_renda)
    rendimento = calculo.calcularRendimento
    assert_equal(12352.01, rendimento.valor_bruto)
    assert_equal(4152.01, rendimento.rendimento_bruto)
    assert_equal(622.8, rendimento.valor_imposto)
    assert_equal(3529.21, rendimento.rendimento_liquido)
    assert_equal(11729.21, rendimento.valor_liquido)
  end
  
  test "teste calculo rendas fixas com diferentes taxas" do
    calculo = Calculo.new(valor_inicial:1000.0, valor_mensal: 0.0, renda_fixa: @cdb1ano)
    rendimento = calculo.calcularRendimento
    assert_equal(1122.82, rendimento.valor_bruto)
    
    calculo = Calculo.new(valor_inicial:1000.0, valor_mensal: 100.0, renda_fixa: @cdb1ano)
    rendimento = calculo.calcularRendimento
    assert_equal(1122.82, rendimento.valor_bruto)
  end
  
end
