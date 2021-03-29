require "./player"
require "./question"

#
# RUN "ruby main.rb [PLAYER1] [PLAYER2]" ON THE COMMAND LINE. <3
#

def first_turn(user_1, user_2)
  question = Question.new
  puts "#{user_1.name}, you're up!"
  puts "What is #{question.one} plus #{question.two}?"
  print "> "

  choice = $stdin.gets.chomp

  if choice.to_i == question.answer
    puts "Correct!"
    puts "-----------"
    puts "#{user_1.name}: #{user_1.score}/3 vs #{user_2.name}: #{user_2.score}/3"
    puts "-----------"
    second_turn(user_1, user_2)
  else
    puts "Uh.. No.. T-that's not correct."
    user_1.score = user_1.score - 1
    puts "-----------"
    puts "#{user_1.name}: #{user_1.score}/3 vs #{user_2.name}: #{user_2.score}/3"
    puts "-----------"
    if !score_validator(user_1, user_2)
      second_turn(user_1, user_2)
    end
  end
end

def second_turn(user_1, user_2)
  question = Question.new
  puts "#{user_2.name}, you're up!"
  puts "What is #{question.one} plus #{question.two}?"
  print "> "

  choice = $stdin.gets.chomp

  if choice.to_i == question.answer
    puts "Correct!"
    puts "-----------"
    puts "#{user_1.name}: #{user_1.score}/3 vs #{user_2.name}: #{user_2.score}/3"
    puts "-----------"
    first_turn(user_1, user_2)
  else
    puts "Uh.. No.. T-that's not correct."
    user_2.score = user_2.score - 1
    puts "-----------"
    puts "#{user_1.name}: #{user_1.score}/3 vs #{user_2.name}: #{user_2.score}/3"
    puts "-----------"
    if !score_validator(user_1, user_2)
      first_turn(user_1, user_2)
    end
  end
end

def score_validator(user1, user2)
  if user1.score == 0
    puts "Looks like #{user2.name} is our winner! Their score: #{user2.score}/3"
    abort
  elsif user2.score == 0
    puts "Looks like #{user1.name} is our winner! Their score: #{user1.score}/3"
    abort
  end
end

user1 = Player.new(ARGV[0])
user2 = Player.new(ARGV[1])
first_turn(user1, user2)
