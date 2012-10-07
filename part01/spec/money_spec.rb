# coding: utf-8

require 'money'

describe Dollar do
  it '#times' do
    five = Dollar.new 5
    (five.times 2).should == Dollar.new(10)
    (five.times 3).should == Dollar.new(15)
  end

  it '#==' do
    Dollar.new(5).should == Dollar.new(5)
    Dollar.new(5).should_not == Dollar.new(6)
  end
end

describe Franc do
  it '#times' do
    five = Franc.new 5
    (five.times 2).should == Franc.new(10)
    (five.times 3).should == Franc.new(15)
  end

  it '#==' do
    Franc.new(5).should == Franc.new(5)
    Franc.new(5).should_not == Franc.new(6)
  end
end