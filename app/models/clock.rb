class Clock < ActiveRecord::Base
  belongs_to :clock_event

  def time_on_clock

    if self.clock_out.present?

      clock_in_time = self.created_at
      clock_out_time = self.clock_out

      total_time = clock_out_time - clock_in_time

      seconds = total_time % 60
      minutes = (total_time / 60) % 60
      hours = total_time / (60 * 60)

      format("%04d:%02d:%02d", hours, minutes, seconds)
    end
  end
end