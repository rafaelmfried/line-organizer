require_relative 'ticket'
require 'thread'

class Queue
  attr_reader :tickets

  def initialize
    @tickets = Array.new
    @mutex = Mutex.new
    @ticket_available = ConditionVariable.new
  end

  def add_ticket
    ticket = Ticket.new
    @mutex.synchronize do
      @tickets << ticket
      @ticket_available.signal
    end
    ticket
  end

  def remove_ticket
    ticket = nil
    @mutex.synchronize do
      while @tickets.empty?
        @ticket_available.wait(@mutex)
      end
      ticket = @tickets.shift
    end
    ticket
  end

  def empty?
    @tickets.nil? || @tickets.empty?
  end
end