class Cli

def run
puts " "
puts "Hello and welcome to my Superhero Identification Application!"
puts " "
puts "Enter a hero name to see information about that hero."
puts " "
@hero_name = gets.strip.downcase
Api.get_hero(@hero_name)

##display list of heros to the user
print_heroes(Hero.all)
## ask them to pick hero
prompt_user
input = gets.strip.downcase

while input != 'exit'
if input == 'list'
  heroes = Hero.select_by_name(@hero_name)
  print_heroes(heroes)
binding.pry
#elsif input.to_i > 0 && input.to_i < heroes.length ## user chooses a character
  #hero = heroes [input.to_i - 1]
  #Api.getHeroDetails(hero)
#elsif ##user chooses another hero
  ## do something else
else
  puts "I did not understand that input - please try again."
end
prompt_user
input = gets.strip.downcase
end
puts " "
puts "Thank you - GoodBye!"
end

def print_heroes(heroes)
  puts " "
  puts "Here are the different versions of #{@name}"
  heroes.each.with_index(1) do |hero, index|
    puts "#{index}. #{hero.name}"
  end
  puts " "
end

def prompt_user
  puts " "
puts "Select a number to see the biography for that character;
type 'list' to see the list again, 'hero' to select a new hero,
or 'exit' to exit."
puts " "
end

end
