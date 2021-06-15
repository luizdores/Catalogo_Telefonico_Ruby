def add_contact(name)
  File.open('catalogo.txt', 'r') do |file|
    $name_exist = file.read.match?(/#{name}\b/i)
  end

  File.open('catalogo.txt', 'r') do
    if $name_exist
      puts 'Contato existente'.red
      puts 'Digite um novo contato'.blue
      name = gets.chomp.to_s
      add_contact(name)
    else
      puts 'Digite o email do contato'.blue
      email = gets.chomp.to_s
      puts 'Digite uma etiqueta para o contato'.blue
      etiqueta = gets.chomp.to_s
      puts 'Digite o telefone do contato'.blue
      tel = gets.chomp.to_i

      if tel.to_s.length == 11
        File.open('catalogo.txt', 'a') do |file|
          file.write("\n#{name}, #{email}, #{etiqueta}, #{tel}")
          puts 'Contato adicionado com sucesso'.green
        end
      else
        puts 'Entrada de número inválida'.red
      end
    end
  end
end

def search_by_name(name)
  File.open('catalogo.txt', 'r') do |file|
    if file.read.match?(/#{name}\b/i)
      lines = IO.readlines('catalogo.txt')
      lines.each do |i|
        puts i.yellow if i.include?(name)
      end
    else
      puts 'Contato não encontrado'.red
    end
  end
end

def contact_delete(name)
  empty_text = ''
  suggest_contacts = []

  File.open('catalogo.txt').each do |line|
    line_array = line.split(',')
    full_contact_name = line_array[0]

    if name.downcase == full_contact_name.downcase || full_contact_name.downcase.include?(name.downcase)
      suggest_contacts.push(full_contact_name)
    end
  end

  if suggest_contacts.length > 1
    puts 'Você quis dizer algum desses nomes?'
    suggest_contacts.each do |i|
      puts i.yellow
    end

    reset_name = gets.chomp.to_s

    contact_delete(reset_name.downcase)
  elsif suggest_contacts.length == 1
    File.open('catalogo.txt').each do |line|
      empty_text += line if line.split(',')[0].downcase != suggest_contacts[0].downcase
    end

    write_file = File.new('catalogo.txt', 'w')
    write_file.write(empty_text)
    write_file.close
    puts 'Contato excluido com sucesso'.green
  else
    puts 'Nenhum nome corresponde ao informado'.red
  end
end
