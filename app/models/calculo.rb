class Calculo < ActiveRecord::Base
  belongs_to :renda_fixa
  validates :valor_inicial,  presence: true
  validates :valor_mensal,  presence: true
  
  
  def calcularRendimentoTeste
    
    dias = ((self.data_de_retirada || self.renda_fixa.vencimento) - Date.today).to_f
    meses = (dias / 30).to_i
    taxa = ((self.renda_fixa.indice.taxa_de_juros + self.renda_fixa.taxa_de_juros) / 100) + 1
    taxa = (taxa ** (1 / 12.0))
    valor_bruto = self.valor_inicial;
    valor_investido = self.valor_inicial;
    meses.times do |i|
      valor_bruto = valor_bruto * taxa.round(4)
      valor_bruto = valor_bruto + self.valor_mensal
      valor_investido += self.valor_mensal
    end
    valor_bruto.round(2).to_f
    Rendimento.new(valor_bruto, valor_investido, self.renda_fixa)
  end
  
  def calcularRendimento
    dias = ((self.data_de_retirada || self.renda_fixa.vencimento) - Date.today).to_f
    meses = (dias / 30).to_i
    taxa = ((self.renda_fixa.indice.taxa_de_juros + self.renda_fixa.taxa_de_juros) / 100) + 1
    taxa = (taxa ** (1 / 12.0))
    valor_bruto = self.valor_inicial;
    valor_investido = self.valor_inicial;
    meses.times do |i|
      valor_bruto = valor_bruto * taxa.round(4)
      valor_bruto = valor_bruto + self.valor_mensal
      valor_investido += self.valor_mensal
    end
    rendimento_bruto = valor_bruto - valor_investido
    valor_imposto = rendimento_bruto * (imposto_de_renda(meses, self.renda_fixa) / 100)
    Rendimento.new(valor_investido, valor_bruto, valor_imposto)
  end
  
  def imposto_de_renda(meses, renda)
    if renda.has_imposto_de_renda
      return renda.imposto_de_renda if renda.is_imposto_de_renda_fixo
      case
      when meses < 6
        return 22.5
      when meses >= 6 && meses < 12
        return 20.0
      when meses >= 12 && meses < 24
        return 17.5
      else
        return 15.0
      end
    else
      return 0.0
    end
  end
  
end
