class RemoveRendaFixaToIndice < ActiveRecord::Migration
  def change
    remove_reference :indices, :renda_fixa, index: true, foreign_key: true
  end
end
