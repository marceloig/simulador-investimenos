class AddHasImpostoDeRendaToRendaFixa < ActiveRecord::Migration
  def change
    add_column :renda_fixas, :has_imposto_de_renda, :boolean
  end
end
