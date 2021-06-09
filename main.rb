# frozen_string_literal: false

require_relative 'functions'

puts 'Bem vindo ao catalogo Telefonico'
puts 'Para adicionar um contato use a opção 1'
puts 'Para pesquisar um contato use a opção 2'
puts 'Para listar os contatos use a opção 3'
puts 'Para apagar um numero use a opção 4'
print '> '
func = gets.chomp.to_i

case func
when 1
  puts 'Você escolheu a adicão de numeros'
  puts 'Digite o nome do contato:'
  name = gets.chomp.to_s
  puts 'Digite o sobrenome do contato'
  surname = gets.chomp.to_s

  File.open('catalogo.txt', 'r') do |file|
    $name_exist = file.read.match?(/#{name}\b/i)
  end

  File.open('catalogo.txt', 'r') do |file|
    $surname_exist = file.read.match?(/#{surname}\b/i)
  end

  File.open('catalogo.txt', 'r') do |file|
    if $name_exist && $surname_exist
      puts 'Contato já existente'
      puts "Deseja continuar?\nS - Sim\nN - Não"
      option = gets.chomp.to_s.downcase

      case option
      when 's'
        puts 'Digite o DDD do contato'
        ddd = gets.chomp.to_i
        puts 'Digite o telefone do contato'
        tel = gets.chomp.to_i
        File.open('catalogo.txt', 'a') do |file|
          file.write("\n#{name}, #{surname}, #{ddd}, #{tel}")
        end
        puts 'Contato adicionado com sucesso'

      when 'n'
        break
      end
    else
      puts 'Digite o DDD do contato'
      ddd = gets.chomp.to_i
      puts 'Digite o telefone do contato'
      tel = gets.chomp.to_i
      File.open('catalogo.txt', 'a') do |file|
        file.write("\n#{name}, #{surname}, #{ddd}, #{tel}")
      end
      puts 'Contato adicionado com sucesso'
    end
  end

when 2

  puts 'Você escolheu a função de pesquisa'
  puts 'Para pesquisar por primeiro nome escolha 1'
  puts 'Para pesquisar por sobrenome escolha 2'
  puts 'Para pesquisar por numero de telefone escolha 3'
  selec = gets.chomp.to_i

  case selec
  when 1 
    puts 'Digite o nome do contato a ser pesquisado'
    name = gets.chomp.to_s
    puts search_by_name(name)

  when 2
    puts 'Digite o nome do contato a ser pesquisado'
    surname = gets.chomp.to_s
    puts search_by_surname(surname)

  when 3 
    puts 'Digite o nome do contato a ser pesquisado'
    number = gets.chomp.to_s
    puts search_by_number(number)

  else
    puts 'Opção invalida'
  end
  
when 3
  puts 'Você escolheu a função de listar contatos'
  File.open('catalogo.txt', 'r') do |file|
    puts file.readline('catalogo.txt')
  end

when 4
  puts 'Você escolheu a função de apagar contatos'
  puts 'Digite o nome do contato a ser excluido'
  name = gets.chomp.to_s
  contact_delete(name)
end
