class Logro < ActiveRecord::Base
  default_scope -> { order("valor_min desc") }
end
