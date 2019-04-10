class ClockEvent < ActiveRecord::Base
  has_many :clocks, -> { order "created_at" }
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  validates :name, presence: true
  validates :description, presence: true

  def current_clock_in
    self.clocks.where(clock_out: nil).last
  end

  def currently_clocked_in?
    current_clock_in
  end

  def clock_status
    if self.clocks.any?
      self.current_clock_in ? "In" : "Out"
    end
  end       

  def total_time_on_clock_event
    total = 0
    self.clocks.each do |clock|

      if clock.clock_out
        clock_in_time = clock.created_at
        clock_out_time = clock.clock_out
        total_time = clock_out_time - clock_in_time
        total += total_time
      end
    end

    total
  end
end