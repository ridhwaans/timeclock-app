class ClocksController < ApplicationController
  before_action :get_clock_event

  def clock_in

    @clock = Clock.create(clock_event: @clock_event)		
    
    if @clock.save
      flash[:notice] = "You have clocked in to #{@clock_event.name}"
      redirect_to :back  
    else
        render 'clock_events/index'
    end
  
  end

  def clock_out

    clock = @clock_event.current_clock_in
    
    if @clock_event.current_clock_in && clock.update(clock_out: Time.now)
      flash[:notice] = "You have clocked out of #{@clock_event.name}"
      redirect_to :back  
    else
        flash[:error] = "You are not clocked in to #{@clock_event.name}, so you can't clock out."
        redirect_to clock_event_path(@clock_event)
    end
  
  end

  private

  def get_clock_event
    @clock_event = ClockEvent.find(params[:id])
  end

end