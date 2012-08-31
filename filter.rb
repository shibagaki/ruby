# coding: utf-8

class Filter
  def initialize
    @constraints = []
  end

  def constraint(&block)
    @constraints << block
  end

  def to_proc
    puts 'to_proc called'
    lambda {|e| @constraints.all? {|fn| fn.call(e)}}
  end
end


filter = Filter.new
filter.constraint{|x| x > 10}
filter.constraint{|x| x.even?}
filter.constraint{|x| x % 3 == 0 }

puts 'call select'
puts (8..24).select(&filter)
