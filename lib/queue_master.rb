require_relative 'line'

class QueueMaster
  def initialize
    @queues = {}
  end

  def create_queue(name)
    @queues[name] = Line.new
  end

  def get_queue(name)
    @queues[name]
  end
end
