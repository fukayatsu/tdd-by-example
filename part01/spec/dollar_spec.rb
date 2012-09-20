# coding: utf-8

require 'dollar'

describe Dollar do
  it 'can multiply' do
    five = Dollar.new
    five.amount.should == 10
  end
end