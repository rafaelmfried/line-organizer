require 'rspec'
require_relative '../lib/attendant'
require_relative '../lib/line'
require_relative '../lib/ticket'

RSpec.describe Attendant do
  let(:queue) { Line.new }
  let(:attendant) { Attendant.create_attendant }

  it 'deve ter um ID único' do
    expect(attendant.id).not_to be_nil
  end

  it 'deve atender a um cliente' do
    ticket = queue.add_ticket
    attendant.request_ticket(queue)
    expect(ticket.attendant_id).to eq(attendant.id)
    expect(ticket.completed_at).not_to be_nil
  end
end
