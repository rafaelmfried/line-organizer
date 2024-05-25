class QueueMaster
  def initialize
    @queues = {}
  end

  def create_queue(name)
    @queues[name] = Queue.new
  end

  def get_queue(name)
    @queues[name]
  end
end
