# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creo los monstruos"
Monstruo.find_or_create_by(nombre: "Nahuelito", edad: 15)
Monstruo.find_or_create_by(nombre: "Dracula", edad: 25)
Monstruo.find_or_create_by(nombre: "Hombre Lobo", edad: 55)


puts "Creo el usuario Administrador"
user = User.create! :name => 'Administrador', :email => 'admin@gmail.com', :localidad => 'La Plata', :codigo => 'ad12', :password => '123456', :password_confirmation => '123456'
