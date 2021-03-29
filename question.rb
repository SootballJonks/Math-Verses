class Question
  attr_reader :one, :two, :answer

  def initialize
    @one = rand(1..20)
    @two = rand(1..20)
    @answer = self.one + self.two
  end

end

# test = Prompt.new
# puts "What is #{test.one} plus #{test.two}?"
# puts test.answer

