class Player
  attr_accessor :name, :score

  def initialize(name)
    @name = name
    @score = 3
  end

end

# test = Player.new("dingus")
# puts test.name