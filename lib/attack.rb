class Attack
  def attack(target)
    target.receive_damage
  end

  def weak_attack(target)
    target.light_damage
  end

  def heavy_attack(target)
    rand(3) == 0 ? 3.times { target.receive_damage } : nil
  end
end