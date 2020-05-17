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
## ask them to pick hero 

end

end

#handles input FROM the user and output TO user
