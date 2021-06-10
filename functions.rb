def add_contact(name)
  File.open('catalogo.txt', 'r') do |file|
    $name_exist = file.read.match?(/#{name}\b/i)
  end
    File.open('catalogo.txt', 'r') do |file|
      if $name_exist
        puts 'Contato já existente'
        puts 'Digite um novo contato'
        name = gets.chomp.to_s
        add_contact(name)
      else
        puts 'Digite o email do contato' 
        email = gets.chomp.to_s
        puts 'Digite uma etiqueta para o contato'
        etiqueta = gets.chomp.to_s
        puts 'Digite o telefone do contato'
        tel = gets.chomp.to_i

        if tel.to_s.length == 11 
          File.open('catalogo.txt', 'a') do |file|
          file.write("\n#{name}, #{email}, #{etiqueta}, #{tel}")
          puts 'Contato adicionado com sucesso'
          end
        else
          puts 'Entrada de número inválida'
        end   
      end
    end
end

def search_by_name(name)
    File.open('catalogo.txt', 'r') do |file|
        if file.read.match?(/#{name}\b/i)

###
          lines = IO.readlines('catalogo.txt')
          for i in lines
            if i.include?(name)
              puts i
            end
          end
###     
        
        else
          puts 'Contato não encontrado'
        end
    end
end

  def contact_delete(name)
    File.open('catalogo.txt', 'r') do |file|
      $name_exist = file.read.match?(/#{name}\b/i)
    end
    
    if $name_exist
      read_file = File.new('catalogo.txt', 'r').read
      write_file = File.new('catalogo.txt', 'w')
      read_file.each_line do |line|
      write_file.write(line) unless line.include? name
      end
      puts 'Contato excluido com sucesso'
    else
      puts 'Contato não encontrado'
    end
  end
