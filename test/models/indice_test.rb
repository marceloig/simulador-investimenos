require 'test_helper'

class IndiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should save Indice with all required atrributes " do
    indice = Indice.new
    indice.indexador = "SELIC"
    indice.taxa_de_juros = 13.0
    
    assert indice.save
  end
end
