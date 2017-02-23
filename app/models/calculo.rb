class Calculo < ActiveRecord::Base
  belongs_to :renda_fixa
  validates :valor_inicial,  presence: true
  validates :valor_mensal,  presence: true
  
  def calcularRendimento
      meses = Date.today.upto(self.data_de_retirada || self.renda_fixa.vencimento).select{|d|  d.day == 1 }.size
      taxa = (renda_fixa.taxa_de_juros / 12)
      valor = self.valor_inicial;
      meses.times do |i|
        valor = valor * ((taxa / 100) + 1)
        valor = valor + self.valor_mensal
      end
      valor.round(2).to_f
  end
  
end
