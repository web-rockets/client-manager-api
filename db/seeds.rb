# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create name: 'Administrador', email: 'admin@gmail.com', password: '123456'

case Rails.env
when 'development'
    puts 'Nada a alimentar'
when 'test'
    user = User.create name: 'Admin', email: 'admin@gmail.com', password: '123456'
    puts "#{user.name} criado com sucesso"
    user = User.create name: 'John', email: 'john@gmail.com', password: '123456'
    puts "#{user.name} criado com sucesso"
    user = User.create name: 'Gib', email: 'gib@gmail.com', password: '123456'
    puts "#{user.name} criado com sucesso"
    user = User.create name: 'Joe', email: 'joe@gmail.com', password: '123456'
    puts "#{user.name} criado com sucesso"
    user = User.create name: 'Lucy', email: 'lucy@gmail.com', password: '123456'
    puts "#{user.name} criado com sucesso"
    user = User.create name: 'Anna', email: 'anna@gmail.com', password: '123456'
    puts "#{user.name} criado com sucesso"
end
