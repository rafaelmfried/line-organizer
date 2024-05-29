require 'rspec'
require_relative '../lib/client'
require_relative '../lib/line'

RSpec.describe Client do
  let(:queue) { Line.new }
  let(:client) { Client.create_client(queue) }

  it 'deve ter um ID único' do
    expect(client.id).not_to be_nil
  end

  it 'deve solicitar um ticket' do
    expect(client.ticket).not_to be_nil
  end
end
