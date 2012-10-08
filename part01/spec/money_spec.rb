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

    Money.dollar(5).should_not == Money.franc(5)
  end

  it '#currency' do
    Money.dollar(1).currency.should == 'USD'
    Money.franc(1).currency.should == 'CHF'
  end

  describe '#+' do
    it 'simple' do
      five = Money.dollar(5)
      sum = five += five
      reduced = Bank.new.reduce(sum, 'USD');
      reduced.should == Money.dollar(10)
    end

    it 'return sum' do
      five = Money.dollar 5;
      sum = five + five;
      sum.augend == five;
      sum.addend == five;
    end
  end
end

describe Bank do
  describe '#reduce' do
    it 'sum' do
      sum = Sum.new(Money.dollar(3), Money.dollar(4))
      result = Bank.new.reduce(sum, 'USD')
      result.should == Money.dollar(7)
    end

    it 'money' do
      result = Bank.new.reduce(Money.dollar(1), 'USD')
      result.should == Money.dollar(1)
    end
  end

  it '#add_rate' do
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)

    result = bank.reduce(Money.franc(2), 'USD')
    result.should == Money.dollar(1)
  end

  describe '#rate' do
    it 'identity_rate' do
      Bank.new.rate('USD', 'USD').should == 1
    end
  end
end

describe Array do
  it 'equals' do
    ['abc'].should == ['abc']
  end
end