require 'rspec'
require_relative '../lib/simulator'

RSpec.describe Simulator do
  it 'executa a simulação e calcula estatísticas' do
    expect { Simulator.run_simulation(10, 2) }.to output(/Estatísticas da Simulação:/).to_stdout
  end
end
