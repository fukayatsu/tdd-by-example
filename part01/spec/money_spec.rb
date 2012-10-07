# coding: utf-8

require 'money'

describe Money do
  it '#times' do
    five = Money.dollar 5;
    five.times(2).should == Money.dollar(10)
    five.times(3).should == Money.dollar(15)
  end

  it '#==' do
    Money.dollar(5).should == Money.dollar(5)
    Money.dollar(5).should_not == Money.dollar(6)

    Money.franc(5).should == Money.franc(5)
    Money.franc(5).should_not == Money.franc(6)

    Money.dollar(5).should_not == Money.franc(5)
  end
end