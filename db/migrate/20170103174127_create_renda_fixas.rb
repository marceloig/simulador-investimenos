class CreateRendaFixas < ActiveRecord::Migration
  def change
    create_table :renda_fixas do |t|
      t.string :titulo
      t.date :vencimento
      t.decimal :taxa_de_juros
      t.string :tipo
      t.decimal :imposto_de_renda
      t.boolean :is_imposto_de_renda_fixo

      t.timestamps null: false
    end
  end
end
