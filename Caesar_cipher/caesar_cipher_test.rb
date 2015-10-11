require 'minitest/autorun'
require './caesar_cipher.rb'

describe "CaesarCipher" do 
  it "returns crypted text" do
    assert_equal "Bmfy f xywnsl!", caesar_cipher("What a string!", 5)
  end
end

  

