require 'spec_helper'

describe Hangman do
  it 'is invalid without Players name' do
    expect{Player.new}.to raise_error(ArgumentError)
  end

  it 'creates valid Player' do
    expect{Player.new(name: 'Test')}.to_not raise_error
  end

 


end
