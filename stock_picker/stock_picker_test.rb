require 'minitest/autorun'
require './stock_picker.rb'

describe 'stock_picker' do
  it 'returns an array' do
    assert_equal [1,4], stock_picker([17,3,6,9,15,8,6,1,10])
  end
end
