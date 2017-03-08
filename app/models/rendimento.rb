class Rendimento
    
    def initialize(valor_investido, valor_bruto, valor_imposto)
        @valor_investido = valor_investido
        @valor_bruto = valor_bruto
        @rendimento_bruto = valor_bruto - valor_investido
        @valor_imposto = valor_imposto
        @rendimento_liquido = rendimento_bruto - valor_imposto
        @valor_liquido = @valor_investido + @rendimento_liquido
    end
    
    def valor_investido
        @valor_investido.round(2).to_f
    end
    
    def valor_bruto
        @valor_bruto.round(2).to_f
    end
    
    def rendimento_bruto
        @rendimento_bruto.round(2).to_f
    end
    
    def valor_imposto
        @valor_imposto.round(2).to_f
    end
    
    def rendimento_liquido
        @rendimento_liquido.round(2).to_f
    end
    
    def valor_liquido
        @valor_liquido.round(2).to_f
    end

end
