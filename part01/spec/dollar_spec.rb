# coding: utf-8

require 'dollar'

describe Dollar do
  it 'can multiply' do
    five = Dollar.new 5
    five.multiply 2
    five.amount.should == 10
  end
end