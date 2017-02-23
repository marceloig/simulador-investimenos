class CreateIndices < ActiveRecord::Migration
  def change
    create_table :indices do |t|
      t.string :indexador
      t.decimal :taxa_de_juros

      t.timestamps null: true
    end
  end
end
