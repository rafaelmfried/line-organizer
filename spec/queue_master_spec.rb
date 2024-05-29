require 'rspec'
require_relative '../lib/queue_master'
require_relative '../lib/line'

RSpec.describe QueueMaster do
  let(:queue_master) { QueueMaster.new }

  it 'deve criar uma fila' do
    queue_master.create_queue('test_queue')
    expect(queue_master.get_queue('test_queue')).not_to be_nil
  end

  it 'deve retornar uma fila existente' do
    queue_master.create_queue('test_queue')
    queue = queue_master.get_queue('test_queue')
    expect(queue).to be_a(Line)
  end
end
