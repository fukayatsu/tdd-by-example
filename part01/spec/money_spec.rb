# coding: utf-8

require 'money'

describe Money do
  it '#==' do
    Money.dollar(5).should_not == Franc.new(5)
  end

  describe '#dollar' do
    it '#times' do
      five = Dollar.new 5
      (five.times 2).should == Money.dollar(10)
      (five.times 3).should == Money.dollar(15)
    end

    it '#==' do
      Money.dollar(5).should == Money.dollar(5)
      Money.dollar(5).should_not == Money.dollar(6)
    end
  end

  describe '#franc' do
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
end