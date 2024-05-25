require 'securerandom'

class Ticket 
  attr_reader :id, :created_at, :completed_at, :attendant_id

  def initialize
    @id = SecureRandom.uuid
    @created_at = Time.now
    @completed_at = nil
    @attendant_id = nil
  end

  def assign_attendant(attendant_id)
    @attendant_id = attendant_id
  end

  def mark_complete
    @completed_at = Time.now
  end
end
