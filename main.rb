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
  name = gets.chomp
  puts 'Digite o sobrenome do contato'
  surname = gets.chomp
  puts 'Digite o DDD do contato'
  ddd = gets.chomp.to_i
  puts 'Digite o telefone do contato'
  tel = gets.chomp.to_i
  
  File.open('catalogo.txt', 'a') do |file|
    file.write("\n#{name}, #{surname}, #{ddd}, #{tel}")
  end
  
  puts 'Contato adicionado com sucesso'

when 2
  puts 'Você escolheu a função de pesquisa'
  puts 'Digite o nome do contato a ser pesquisado'
  name = gets.chomp.to_s
  File.open('catalogo.txt', 'r') do |file|
    if file.read.match? /\A#{name}\b/i
      puts 'Contato encontrado'
      File.open 'catalogo.txt' do |file|
        puts file.find { |line| line =~ /\A#{name}\b/i}
      end
    else
      puts 'Contato não encontrado'
    end
  end

when 3
  puts 'Você escolheu a função de listar contatos'
  File.open('catalogo.txt', 'r') do |file|
    puts file.read
  end

when 4
  puts 'Você escolheu a função de apagar contatos'
else
  puts 'Escolha uma opção valida'
end
