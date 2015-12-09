require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client
  def initialize
    puts 'Initializing MicroBlogger'
    @client = JumpstartAuth.twitter
  end

  def start
    puts 'Welcome to the Twitter Spambot'
    begin
      puts
      puts 'Enter command:'
      puts 'q - quit'
      puts 't - send tweet'
      command = gets.chomp
      case command
        when 't' then self.send
        when 'f' then show_friends
        when 'q' then puts 'Bye'
        else puts "I don't understand command #{command}" 
      end
    end until command == 'q'
  end

  def send
    puts 'Please type your message:'
    message=gets.chomp
    tweet(message)
  end

  def show_friends
    friends = @client.friends
    puts "You have currently #{friends.count} friends"
    friends.each do |f|
      puts f
    end
  end

  def tweet(message)
    if message.length>140
      puts 'Your message is too long.'
    else
      @client.update(message)
      puts 'Message sent.'
    end
  end
end

@m = MicroBlogger.new
@m.start
