class AddRendaFixaToIndice < ActiveRecord::Migration
  def change
    add_reference :indices, :renda_fixa, index: true, foreign_key: true
  end
end
