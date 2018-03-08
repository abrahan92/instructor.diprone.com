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

ActiveRecord::Schema.define(version: 20161011154620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categoria", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clases", force: :cascade do |t|
    t.string   "titulo"
    t.string   "resumen"
    t.string   "archivo_uid"
    t.string   "archivo_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "seccion_id"
    t.index ["seccion_id"], name: "index_clases_on_seccion_id", using: :btree
  end

  create_table "cursos", force: :cascade do |t|
    t.string   "titulo"
    t.string   "subtitulo"
    t.string   "idioma"
    t.string   "categoria"
    t.string   "subcategoria"
    t.string   "nivel"
    t.string   "status"
    t.string   "resumen"
    t.string   "portada_uid"
    t.string   "portada_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_cursos_on_user_id", using: :btree
  end

  create_table "idiomas", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mensajes", force: :cascade do |t|
    t.string   "sujeto"
    t.string   "mensaje"
    t.string   "status"
    t.string   "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_mensajes_on_user_id", using: :btree
  end

  create_table "operacions", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paginas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pais", force: :cascade do |t|
    t.string   "iso"
    t.string   "name"
    t.string   "nicename"
    t.string   "iso3"
    t.integer  "numcode"
    t.integer  "phonecode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permisos", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "rol_id"
    t.integer  "pagina_id"
    t.integer  "operacion_id"
    t.index ["operacion_id"], name: "index_permisos_on_operacion_id", using: :btree
    t.index ["pagina_id"], name: "index_permisos_on_pagina_id", using: :btree
    t.index ["rol_id"], name: "index_permisos_on_rol_id", using: :btree
  end

  create_table "rols", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seccions", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "curso_id"
    t.index ["curso_id"], name: "index_seccions_on_curso_id", using: :btree
  end

  create_table "subcategoria", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "telefono"
    t.string   "codigop"
    t.string   "ciudad"
    t.string   "pais"
    t.string   "direccion"
    t.string   "biografia"
    t.string   "profesion"
    t.string   "foto_uid"
    t.string   "foto_name"
    t.string   "id_padre"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "rol_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["rol_id"], name: "index_users_on_rol_id", using: :btree
  end

  add_foreign_key "clases", "seccions"
  add_foreign_key "cursos", "users"
  add_foreign_key "mensajes", "users"
  add_foreign_key "permisos", "operacions"
  add_foreign_key "permisos", "paginas"
  add_foreign_key "permisos", "rols"
  add_foreign_key "seccions", "cursos"
  add_foreign_key "users", "rols"
end
