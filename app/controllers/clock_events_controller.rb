class ClockEventsController < ApplicationController

  before_action :find_clock_event, only: [:edit, :show, :update]

  def index

    if !logged_in?
      redirect_to login_path
    else
      @user = User.find(current_user)
      @clock = Clock.new
    end

  end

  def show
    @clock = Clock.new
  end 

  def new
    @clock_event = ClockEvent.new
  end

  def create

    @clock_event = ClockEvent.new(clock_event_params)
    @clock_event.creator = current_user
    if @clock_event.save
      flash[:notice] = "A new clock event has been added"
      redirect_to clock_events_path
    else
      render 'new'
    end

  end

  def edit; end

  def update



    if @clock_event.update(clock_event_params)
      flash[:notice] = "#{@clock_event.name} has been updated"
      redirect_to clock_event_path(@clock_event)
    else
      render :edit
    end
    
  end


  private

  def clock_event_params
    params.require(:clock_event).permit(:name, :description)
    params.require(:clock_event).permit(:name, :description)
  end

  def find_clock_event
    @clock_event = ClockEvent.find(params[:id])
  end

end