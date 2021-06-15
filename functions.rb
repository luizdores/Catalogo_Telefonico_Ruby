require_relative 'functions'
require 'colorize'

loop do
  puts 'Bem vindo ao catalogo Telefonico'
  puts '[1] Adicionar contato'.blue
  puts '[2] Pesquisar contato'.blue
  puts '[3] listar contatos'.blue
  puts '[4] Apagar um contato'.blue
  puts '[5] Sair'.blue
  print '> '
  func = gets.chomp.to_i

  case func
  when 1
    puts 'Adicionar contato'
    puts 'Digite o nome do contato'.blue
    name = gets.chomp.to_s.capitalize()
    add_contact(name)

  when 2
    puts 'Digite o contato a ser pesquisado'.blue
    name = gets.chomp.to_s.capitalize()
    search_by_name(name)

  when 3
    puts 'lista de contatos'
    File.open('catalogo.txt', 'r') do |file|
      puts file.readline('catalogo.txt').yellow
    end

  when 4
    puts 'Apagar contatos'
    puts 'Digite o nome do contato a ser excluido'.blue
    name = gets.chomp.to_s.capitalize()
    contact_delete(name)
  when 5
    break
  else
    puts 'Entrada Inválida !!!'.red
  end
  system('pause')
  system('cls')
end
