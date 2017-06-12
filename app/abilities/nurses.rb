Canard::Abilities.for(:nurse) do
  can [:manage], User
  cannot [:destroy], User
end
