class Game
  def initialize
    @player = Player.new('Tom')
  end

  def play
    current_guess=@player.guess_code
    10.times do |i|
      puts current_guess
    end
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
    if /^([ABCD]){4}\b/=~answer
      return answer
    else
      puts 'I don\'t understand your answer.'
      puts 'Please make a guess in format XXXX'
      guess_code
    end
  end

end

@g=Game.new
@g.play
