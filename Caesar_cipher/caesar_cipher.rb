#!/usr/bin/ruby
def caesar_cipher(text, key=0)
  chars = text.split('').map do |l|
    if l=~/[A-Za-z]/
      start = (l=~/[a-z]/ ? 97 : 65) 
      ((l.ord-start+key) % 26 + start).chr
    else
      l
    end
  end
  chars.join
end



