Hero.delete_all

10.times do
  Hero.create name: Faker::Superhero.name
end