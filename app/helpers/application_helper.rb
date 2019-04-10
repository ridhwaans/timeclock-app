module ApplicationHelper
  
  def clock_in_date(clock_created_at)
    clock_created_at.strftime("%B %d, %Y")
  end

  def clock_in_time(clock_created_at)
    clock_created_at.strftime("%l:%M:%S%p")
  end

  def clock_out_time(clock_out_at)
    clock_out_at.strftime("%l:%M:%S%p") if clock_out_at
  end

  def format_datetime(dt)
    if dt
      dt.strftime("%l:%M:%S%p %Z on %B %d, %Y")
    end
  end

  def format_total_time(time)
    hours = time / (60 * 60)
    minutes = (time / 60) % 60
    seconds = time % 60
    format("%04d:%02d:%02d", hours, minutes, seconds)

  end

  def total_time_on_clock_event(clock_event)
    @total_time = 0

    clock_event.clocks.each do |clock|
        @total_time
    end
    
    hours = @total_time / (60 * 60)
    minutes = (@total_time / 60) % 60
    seconds = @total_time % 60

    format("%04d:%02d:%02d", hours, minutes, seconds)
  end
end
