require 'rails_helper'

describe ClockEvent do
  
  describe "Most recent clock in" do
    it "should return the last clocked in time if there are multiple contigious clock ins but no clock out" do
      clock_event = ClockEvent.create(name: 'test clock_event', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
      check1 = Clock.create(clock_event: clock_event, clock_out: 1.day.ago)
      check2 = Clock.create(clock_event: clock_event)
      check3 = Clock.create(clock_event: clock_event, clock_out: 1.day.ago)
      expect(clock_event.current_clock_in).to eq(check2)
    end

    it "should return nill datetime if the clock event has no clock ins" do
      clock_event = ClockEvent.create(name: 'test clock_event', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
      expect(clock_event.current_clock_in).to eq(nil)
    end
  end

  describe "Clock status" do
    it "should be nill if there are no check ins" do
      clock_event = ClockEvent.create(name: 'test clock_event', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
      expect(clock_event.clock_status).to eq(nil)
    end

    it "should be 'In' if there is a check in" do
      clock_event = ClockEvent.create(name: 'test clock_event', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
      check1 = Clock.create(clock_event: clock_event)
      expect(clock_event.clock_status).to eq('In')
    end

    it "should be 'Out' if the user has checked in and out" do
      clock_event = ClockEvent.create(name: 'test clock_event', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
      check1 = Clock.create(clock_event: clock_event, clock_out: 1.day.ago)
      expect(clock_event.clock_status).to eq('Out')
    end
  end
  
end