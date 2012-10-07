# coding: utf-8

require 'dollar'

describe Dollar do
  it 'can multiply' do
    five = Dollar.new 5
    product = five.times 2
    product.amount.should == 10

    product = five.times 3
    product.amount.should == 15
  end
end