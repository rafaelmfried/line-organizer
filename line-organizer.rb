require_relative 'lib/simulator'

loop do
  puts "Escolha uma opção:"
  puts "1. Executar Simulação"
  puts "2. Sair"

  opcao = gets.chomp.to_i

  case opcao
  when 1
    puts "Número de clientes:"
    num_clients = gets.chomp.to_i
    puts "Número de atendentes:"
    num_attendants = gets.chomp.to_i

    Simulator.run_simulation(num_clients, num_attendants)
  when 2
    break
  else
    puts "Opção inválida. Tente novamente."
  end
end
