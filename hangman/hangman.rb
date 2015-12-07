class Hangman
  
  def run
    Store.download_dictionary
    Store.read_dictionary
    @g=Game.new(Store.read_dictionary)
    @g.run
  end
  
end

class Store
  require 'open-uri'

  DICTIONARY_FILE='dictionary.txt'
  
  def self.download_dictionary
    unless File.exist?(DICTIONARY_FILE)
      puts 'Downloading dictionary file...'
      download = open('http://scrapmaker.com/data/wordlists/twelve-dicts/5desk.txt')
      IO.copy_stream(download, DICTIONARY_FILE)
    end
  end

  def self.read_dictionary
    begin
      @answer=File.readlines(DICTIONARY_FILE).sample.strip.downcase
    end until @answer.length.between?(5,12)
    return @answer
  end
end

class Game
  def initialize(word)
    @word = word
    @answer_arr = Array.new(@word.length, '_')
    @total = 0
  end

  def run
    puts 'Hello, let\'s play Hangman.'
    begin
      guess()
      puts ''
      puts 'Make a guess...'
      letter=gets.chomp
      check_answer(letter)
      break if win
      puts
      puts "Attemp no: #{@total}"
      puts 
    end until letter=='quit'
  end

  def guess
    print @answer_arr.join(' ')
  end

  def win
    until @answer_arr.include?('_') do
      puts "Congratulations"
      puts "You made it in #{@total} attempts"
      puts guess()
      return true
    end
  end
  
  def check_answer(letter)
    @total+=1
    if @word.include?(letter)
      @word.split('').each_with_index do |l,i|
        @answer_arr[i]=letter if l==letter
      end
    end
  end
end

@h=Hangman.new
@h.run
