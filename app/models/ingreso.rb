class Ingreso < ActiveRecord::Base
  default_scope -> { order("created_at desc") }
  belongs_to :user
  belongs_to :aula
end
