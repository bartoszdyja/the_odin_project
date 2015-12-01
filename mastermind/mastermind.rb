class Game
  COLORS = ['R','G','B', 'O', 'D']
  def initialize
    @player = Player.new('Tom')
    @results = []
    @answer = randomize()
  end

  def randomize
   results = []
   4.times {results<<COLORS.sample}
   results
  end

  def play
    10.times do |i|
      puts
      puts "Attempt no: #{i+1}"
      current_guess=@player.guess_code
      return if current_guess == 'quit'
      @results << [current_guess, tip(current_guess)]
      show_results
      if tip(current_guess)[1]==4
        puts 'You won!!!'
        return
      end
    end
    puts "The combination was #{@answer}"
  end

  def tip (guess)
    near = []
    exact = []
    @answer.each_with_index do |l,i|
      near << l if guess.include?(l)
      exact << l if guess[i]==l
    end
    [near.length,exact.length]
  end

  def show_results
    @results.each_with_index {|x,y| puts "#{y+1}: Combination #{x[0]} has #{x[1][1]} exact maches and #{x[1][0]-x[1][1]} near matches. "}
  end
end

class Player
  def initialize (name)
    @name = name
  end

  def guess_code
    puts 'What is your guess?'
    validate_answer(gets.chomp)
  end

  def validate_answer answer
    if /^([RGBOD]){4}\b|^quit\b/=~answer.upcase!
      return answer
    else
      puts 'I don\'t understand your answer.'
      puts 'Please make a guess in format XXXX or type \'quit\''
      puts
      guess_code
    end
  end

end

@g=Game.new
@g.play
