#!/usr/bin/ruby
dictionary = [ "below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
def substrings(text, dictionary)
  results = Hash.new(0)
  text.downcase.split(' ').each do |test_word|
    dictionary.each do |word|
      if test_word.include? word
        results[word] +=1
      end
    end
  end
end

substrings("Howdy partner, sit down! How's it going?", dictionary)

