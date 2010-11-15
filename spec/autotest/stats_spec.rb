require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "AutotestStats" do
  it "should add hooks to autotest" do
    Autotest.should_receive(:add_hook).with(:initialize)
    Autotest.should_receive(:add_hook).with(:red)
    Autotest.should_receive(:add_hook).with(:green)
    require File.expand_path(File.dirname(__FILE__) + '/../../lib/autotest/stats')
  end
end

describe "after Autotest initializes" do
  include Autotest::Stats

  before(:each) do
    init_hook
  end

  it "should track the number of red/green cycles" do
    @cycles.should == 0
    red_hook
    green_hook
    @cycles.should == 1
  end

  it "should not treat multiple green events as cycles" do
    red_hook
    2.times { green_hook }
    @cycles.should == 1
  end

  it "should report every cycle up to five" do
    should_receive(:puts).with("1 cycle")
    (2..5).each { |count| should_receive(:puts).with("#{count} cycles") }
    6.times do
      red_hook
      green_hook
    end
  end

  describe "after five cycles have passed" do

    before(:each) do
      5.times do
        red_hook
        green_hook
      end
    end

    it "should report every five cycles thereafter" do
      should_not_receive(:puts).with("6 cycles")
      4.times do
        red_hook
        green_hook
      end

      should_receive(:puts).with("10 cycles")
      2.times do
        red_hook
        green_hook
      end
    end

  end
end

