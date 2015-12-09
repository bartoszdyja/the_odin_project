class Hangman
  
  def run 
    puts "Hello, enter command:"
    puts "s - start new game"
    puts "l - load saved game"
    command = gets.chomp
    case command
      when 's' then start_new_game
      when 'l' then load_saved_game
    end
        
  end

  def load_saved_game
    state = Store.load_game
    #@g=Game.new(state["answer"],state["total"],state["current_state"])
    @g=Game.new(state["answer"],state["total_attempts"],state["current_state"])
    @g.run

  end

  def start_new_game
    Store.download_dictionary
    Store.read_dictionary
    @g=Game.new(Store.read_dictionary)
    @g.run
  end
  
end

class Store
  require 'open-uri'
  require 'json'
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
  
  def self.load_game
    file = File.read('saved_game.json')
    save_hash = JSON.parse(file)
  end
end

class Game
  def initialize(word, total=0, array=Array.new(word,'_'))
    @word = word
    @answer_arr = array
    @total=total
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
    puts 'Do you want to save the game?'
    puts 'yes / no'
    answer=gets.chomp
    save_game(@word, @total, @answer_arr) if answer=='yes'
  end

  def save_game(word, total, array)
    
    save_hash = {
      answer: word,
      total_attempts: total,
      current_state: array
    }

    File.open("saved_game.json", 'w') do |f|
      f.write(JSON.pretty_generate(save_hash))
    end  
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
