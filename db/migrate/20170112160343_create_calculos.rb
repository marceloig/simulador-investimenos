class CreateCalculos < ActiveRecord::Migration
  def change
    create_table :calculos do |t|
      t.decimal :valor_inicial
      t.decimal :valor_mensal
      t.date :data_de_retirada
      t.references :renda_fixa, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
