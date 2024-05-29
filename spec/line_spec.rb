require 'rspec'
require_relative '../lib/line'
require_relative '../lib/ticket'

RSpec.describe Line do
  let(:queue) { Line.new }

  it 'deve adicionar um ticket' do
    ticket = queue.add_ticket
    expect(queue.tickets).to include(ticket)
  end

  it 'deve remover um ticket' do
    ticket = queue.add_ticket
    expect(queue.remove_ticket).to eq(ticket)
  end

  it 'deve retornar vazio quando não houver tickets' do
    expect(queue.empty?).to be true
    queue.add_ticket
    expect(queue.empty?).to be false
  end
end
