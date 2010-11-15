require 'rubygems'
require 'autotest'

module Autotest::Stats
  attr_reader :cycles
  Autotest.add_hook(:initialize) { init_hook }
  Autotest.add_hook(:red) { red_hook }
  Autotest.add_hook(:green) { green_hook }

  def init_hook
    @cycles = 0
  end

  def green_hook
    @cycles += 1 if @failing
    @failing = false
    puts "1 cycle" if (@cycles == 1)
    if @cycles.between? 2, 5 or @cycles % 5 == 0
      puts "#{@cycles} cycles"
    end
  end

  def red_hook
    @failing = true
  end
end