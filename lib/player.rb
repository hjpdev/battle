class Player
  DEFAULT_HP = 100

  attr_reader :name, :hit_points

  def initialize(name)
    @name = name
    @hit_points = DEFAULT_HP
  end

  def reset_hp
    @hit_points = DEFAULT_HP
  end

  def light_damage
    @hit_points -= 51
  end

  def receive_damage
    @hit_points -= rand(1..10)
  end
end 