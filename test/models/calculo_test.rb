require 'test_helper'

class CalculoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @renda_fixa_pre_fixado = renda_fixas(:testePreFixado)
    @selic = renda_fixas(:selic)
  end
  
  test "teste calculo renda fixa pre-fixado com taxa de 12% com retirada antes e no rendimento e com e sem valor mensal" do
    calculo = Calculo.new(valor_inicial:500.0, valor_mensal: 0.0, data_de_retirada: Date.today.next_year(5), renda_fixa: @renda_fixa_pre_fixado)
    assert_equal(908.35, calculo.calcularRendimento)
    
    calculo = Calculo.new(valor_inicial:500.0, valor_mensal: 500.0, data_de_retirada: Date.today.next_year(5), renda_fixa: @renda_fixa_pre_fixado)
    assert_equal(41743.18, calculo.calcularRendimento)
    
    calculo = Calculo.new(valor_inicial:500.0, valor_mensal: 0.0, renda_fixa: @renda_fixa_pre_fixado)
    assert_equal(2361.05, calculo.calcularRendimento)
    
    calculo = Calculo.new(valor_inicial:500.0, valor_mensal: 500.0, renda_fixa: @renda_fixa_pre_fixado)
    assert_equal(188465.57, calculo.calcularRendimento)
  end
  
  test "teste calculo renda fixa Selic com taxa selic com retirada antes e no rendimento e com e sem valor mensal" do
    calculo = Calculo.new(valor_inicial:1000.0, valor_mensal: 0.0, renda_fixa: @selic)
    assert_equal(908.35, calculo.calcularRendimento)
  end
  
end
