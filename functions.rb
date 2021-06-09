  def add_contact(name, surname)
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
  end
  
  def search_by_name(name)
    File.open('catalogo.txt', 'r') do |file|
        if file.read.match?(/#{name}\b/i)
          puts 'Contato encontrado'
          File.open 'catalogo.txt' do |file|
            puts file.find { |line| line =~ /#{name}\b/i }
          end
        else
          puts 'Contato não encontrado'
        end
      end
  end

  def search_by_surname(surname)
    File.open('catalogo.txt', 'r') do |file|
        if file.read.match?(/#{surname}\b/i)
          puts 'Contato encontrado'
          File.open 'catalogo.txt' do |file|
            puts file.find { |line| line =~ /#{surname}\b/i }
          end
        else
          puts 'Contato não encontrado'
        end
      end
  end

  def search_by_number(number)
    File.open('catalogo.txt', 'r') do |file|
        if file.read.match?(/#{number}\b/i)
          puts 'Contato encontrado'
          File.open 'catalogo.txt' do |file|
            puts file.find { |line| line =~ /#{number}\b/i }
          end
        else
          puts 'Contato não encontrado'
        end
      end
  end

  def contact_delete(contact)
    File.open('catalogo.txt', 'r') do |file|
        $name_exist = file.read.match?(/#{name}\b/i)
      end
    
      puts 'Digite o sobrenome do contato'
      surname = gets.chomp.to_s
    
      File.open('catalogo.txt', 'r') do |file|
        $surname_exist = file.read.match?(/#{surname}\b/i)
      end
    
      if $name_exist && $surname_exist
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