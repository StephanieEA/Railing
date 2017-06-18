Canard::Abilities.for(:admin) do
  can [:destroy, :update], User
end
