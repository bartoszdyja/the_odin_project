module Tictactoe
require_relative 'player.rb'
  class Game

    def initialize
      @current_player = Player.new('Tom', 'X')
      @other_player = Player.new('John', 'O')
      @board = Board.new
    end

    def start
      loop do
        make_move(@current_player)
        break if significant_status
        change_player
      end
    end

    def change_player
      @current_player,@other_player = @other_player, @current_player
    end

    def significant_status
      if @move == 'Q'
        puts 'Quitted'
        return true
      elsif won?
        puts "#{@current_player.name} won the game"
        puts @board.draw_board
        return true
      end
    end

    def won?
      patterns = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
      patterns.any? do |p|
        return true if @board.grid.values_at(*p).uniq*''==@current_player.figure
      end
    end

    def make_move(player)
      loop do
        @board.draw_board
        puts "It' your move: #{player.name}, where do you want to put your: #{player.figure}"
        @move=gets.chomp
        if validate(@move, player)
          return
        end
      end
    end

    def validate(move, player)
      return true if move=='Q'
      if @board.grid[move.to_i]=='_'
        @board.set_position(player,move.to_i)
        true
      end     
    end

    
    def is_finished?
      true if @move=='Q'
    end

    def board_full
      false
    end

    def winner
      #[true,false].sample
    end
  end

  class Board
    def initialize
      @grid = Array.new(9,'_')
    end

    attr_reader :grid
    
    def draw_board
      puts "#{@grid[0]} | #{@grid[1]} | #{@grid[2]} \t 0 | 1 | 2"
      puts "#{@grid[3]} | #{@grid[4]} | #{@grid[5]} \t 3 | 4 | 5"
      puts "#{@grid[6]} | #{@grid[7]} | #{@grid[8]} \t 6 | 7 | 8"
    end
    
    def set_position(player, position)
        @grid[position.to_i] = player.figure
    end
  end
  
end
