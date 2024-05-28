require_relative 'attendant'
require_relative 'client'
require_relative 'queue_master'

module Simulator
  def self.run_simulation(num_clients, num_attendants)
    queue_master = QueueMaster.new
    queue_master.create_queue('main_queue')
    queue = queue_master.get_queue('main_queue')

    attendants = Array.new(num_attendants) { Attendant.create_attendant }
    clients = []

    client_threads = []
    attendant_threads = []

    # Simula chegada de clientes
    num_clients.times do
      sleep(rand(0..5)) # Simula tempo aleatório entre chegadas de clientes
      client_threads << Thread.new { clients << Client.create_client(queue) }
    end

    # Simula atendimento dos clientes
    attendants.each do |attendant|
      attendant_threads << Thread.new do
        until queue.empty? && client_threads.all?(&:stop?)
          attendant.request_ticket(queue)
        end
      end
    end

    # Aguarda todas as threads dos clientes
    client_threads.each(&:join)

    # Aguarda o término da simulação para todas as threads dos atendentes
    attendant_threads.each(&:join)

    calculate_statistics(clients)
  end

  def self.calculate_statistics(clients)
    total_wait_time = 0
    total_service_time = 0
    completed_tickets = 0

    clients.each do |client|
      if client.ticket.completed_at
        wait_time = client.ticket.completed_at - client.ticket.created_at
        service_time = client.ticket.completed_at - client.ticket.created_at
        total_wait_time += wait_time
        total_service_time += service_time
        completed_tickets += 1
      end
    end

    if completed_tickets > 0
      avg_wait_time = total_wait_time / completed_tickets
      avg_service_time = total_service_time / completed_tickets
      utilization = total_service_time / (completed_tickets * 10) # considerando tempo máximo de atendimento de 10 segundos

      puts "Estatísticas da Simulação:"
      puts "Tempo médio de espera: #{avg_wait_time} segundos"
      puts "Tempo médio no sistema: #{avg_service_time} segundos"
      puts "Taxa de ocupação dos atendentes: #{utilization * 100}%"
    else
      puts "Nenhum atendimento foi concluído durante a simulação."
    end
  end
end
