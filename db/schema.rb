# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170112160343) do

  create_table "calculos", force: :cascade do |t|
    t.decimal  "valor_inicial"
    t.decimal  "valor_mensal"
    t.date     "data_de_retirada"
    t.integer  "renda_fixa_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "calculos", ["renda_fixa_id"], name: "index_calculos_on_renda_fixa_id"

  create_table "indices", force: :cascade do |t|
    t.string   "indexador"
    t.decimal  "taxa_de_juros"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "renda_fixas", force: :cascade do |t|
    t.string   "titulo"
    t.date     "vencimento"
    t.decimal  "taxa_de_juros"
    t.string   "tipo"
    t.decimal  "imposto_de_renda"
    t.boolean  "is_imposto_de_renda_fixo"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "indice_id"
    t.boolean  "has_imposto_de_renda"
  end

  add_index "renda_fixas", ["indice_id"], name: "index_renda_fixas_on_indice_id"

end
