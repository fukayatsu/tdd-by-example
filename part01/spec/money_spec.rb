# coding: utf-8

require 'money'

describe Money do
  it '#*' do
    five = Money.dollar 5;
    (five * 2).should == Money.dollar(10)
    (five * 3).should == Money.dollar(15)
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
    let (:five_bucks) { Money.dollar(5) }
    let (:ten_francs) { Money.franc(10) }

    it 'simple' do
      sum = five_bucks + five_bucks
      reduced = Bank.new.reduce(sum, 'USD');
      reduced.should == Money.dollar(10)
    end

    it 'return sum' do
      sum = five_bucks + five_bucks;
      sum.augend == five_bucks;
      sum.addend == five_bucks;
    end

    it 'miexed addition' do
      bank = Bank.new
      bank.add_rate('CHF', 'USD', 2)
      result = bank.reduce((five_bucks + ten_francs), 'USD')
      result.should == Money.dollar(10)
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

describe Sum do
  let(:five_bucks) { Money.dollar(5) }
  let(:ten_francs) { Money.franc(10) }
  let(:bank) {Bank.new}

  before(:each) {
    bank.add_rate('CHF', 'USD', 2)
  }

  it '#plus' do
    sum = Sum.new(five_bucks, ten_francs) + five_bucks
    result = bank.reduce(sum, 'USD')
    result.should == Money.dollar(15)
  end

  it '#times' do
    sum = Sum.new(five_bucks, ten_francs) * 2
    result = bank.reduce(sum, 'USD')
    result.should == Money.dollar(20)
  end
end

describe Array do
  it 'equals' do
    ['abc'].should == ['abc']
  end
end