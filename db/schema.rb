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

ActiveRecord::Schema.define(version: 20170323013352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "res"
    t.integer  "comentario_id"
    t.integer  "usuario_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "aulas", force: :cascade do |t|
    t.string   "NombreAula"
    t.string   "Departemento"
    t.integer  "ConsumoAula"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "estado"
    t.string   "estadoLuces"
    t.string   "estadoProyector"
    t.string   "estadoAire"
    t.float    "temperatura"
  end

  create_table "cards", force: :cascade do |t|
    t.string   "numero"
    t.string   "email_usuario"
    t.integer  "usuario_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "cv"
  end

  create_table "comentarios", force: :cascade do |t|
    t.text     "coment"
    t.integer  "Id_usuario"
    t.integer  "Id_gauchada"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "estadisticas", force: :cascade do |t|
    t.string   "texto"
    t.integer  "cant1"
    t.integer  "cant2"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "usuario"
    t.integer  "fecha"
    t.integer  "comentarios"
    t.integer  "pagos"
    t.integer  "resupuestas"
    t.integer  "respuestas"
  end

  create_table "gauchadas", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "ubicacion"
    t.string   "titulo"
    t.string   "imagen"
    t.integer  "gauchada_id"
    t.integer  "postulacion_id"
    t.string   "estado"
  end

  create_table "ingresos", force: :cascade do |t|
    t.integer  "HoraEntrada"
    t.integer  "HoraSalida"
    t.integer  "ConsumoParcial"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "aula_id"
    t.datetime "horaEnt"
    t.datetime "horaSal"
  end

  create_table "logros", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "valor_min"
    t.integer  "valor_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monstruos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "edad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "texto"
    t.integer  "usuario_id"
    t.integer  "gauchada_id"
    t.integer  "comentario_id"
    t.integer  "respuesta_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "postulacions", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "localidad"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "gauchada_id"
    t.string   "estado"
    t.datetime "fecha"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.datetime "date_of_birth"
    t.boolean  "admin",                  default: false
    t.string   "localidad"
    t.integer  "gauchada_id"
    t.integer  "postulacion_id"
    t.integer  "puntos"
    t.string   "codigo"
    t.integer  "consumo"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
