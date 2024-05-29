require 'rspec'
require_relative '../lib/ticket'

RSpec.describe Ticket do
  let(:ticket) { Ticket.new }

  it 'deve ter um ID único' do
    expect(ticket.id).not_to be_nil
  end

  it 'deve marcar como completo' do
    ticket.mark_complete
    expect(ticket.completed_at).not_to be_nil
  end

  it 'deve atribuir um atendente' do
    attendant_id = 'test_attendant'
    ticket.assign_attendant(attendant_id)
    expect(ticket.attendant_id).to eq(attendant_id)
  end
end
