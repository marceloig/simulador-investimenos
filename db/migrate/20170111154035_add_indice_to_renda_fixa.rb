class AddIndiceToRendaFixa < ActiveRecord::Migration
  def change
    add_reference :renda_fixas, :indice, index: true, foreign_key: true
  end
end
