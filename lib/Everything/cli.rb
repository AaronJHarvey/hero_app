class Cli

  def run
    puts " "
    puts "Hello and welcome to my Superhero Identification Application!"
    puts " "
    prompt_for_hero
    input_hero
  end

  def input_hero
    receive_and_use_the_hero
    while_loop
  end

  def receive_and_use_the_hero
      @hero_name = gets.strip.downcase #uses the input from the user (name) to set the hero name they are looking for
      mod_name = @hero_name.tr(" ", "_")# replaces any spaces the user inputs with an underscore (what the API recognizes)
      Api.get_hero(mod_name)#gets any heros from the API that fit the criteria of the name the user input
    if Hero.select_by_name(@hero_name).count > 0 #If the hero name returns anything
      print_heroes(Hero.select_by_name(@hero_name))#displays a list of the heroes
      prompt_user #asks user to choose a number
    else
      puts " "
      puts "We could not find information on #{@hero_name}. Try again"
      puts " "
      prompt_for_hero
      receive_and_use_the_hero
    end
  end

  def prompt_for_hero
      puts "Enter a hero name to see information about that hero."
      puts " "
  end

  def print_heroes(heroes)
    puts " "
    puts "Here are the different versions of #{@hero_name.upcase}"
    heroes.each.with_index(1) do |hero, index|
      puts "#{index}. #{hero.name}"
    end
    puts " "
  end

  def print_character(character)
    puts character.name
    puts character.biography
  end

  def prompt_user
    puts " "
    puts "Select a number to see the biography for that character;
    type 'new' to enter a new hero, type 'list' to see the list again,
    or 'exit' to exit."
    puts " "
  end


def while_loop
  input = gets.strip.downcase

  while input != 'exit' ## creates a loop of things that continues being the options until the user inputs exit
    if input == 'list' #if user inputs list
      heroes = Hero.select_by_name(@hero_name) #defines variable as the heroes that include the name the user searched
      print_heroes(heroes) # displays list of the versions of the heroes (variable defined in above line)
      prompt_user #asks the user to choose a version of the hero, request the list again, select new to search for a different hero, or exit to leave
    elsif input.to_i > 0 && input.to_i <= Hero.select_by_name(@hero_name).length ##converts input to integer, if that is greater than 0 and less than the number of items in the list
        character = Hero.select_by_name(@hero_name)[input.to_i - 1] #name associated with the input - 1 (since humans work from 1 and computers work from 0) becomes the current character we are using/looking at
        Api.getHeroDetails(character).to_s if !character.biography # get specific details(biography) about the character we are working with currently
        print_character(character) #displays the current character's name and biography
        prompt_user #asks the user to choose a version of the hero, request the list again, select new to search for a different hero, or exit to leave
      elsif input == 'new' #if user inputs new
        prompt_for_hero#request user inputs a hero name
        receive_and_use_the_hero #gets the input from the user
      else
        puts "I'm sorry, I did not understand that input - please try again."
        heroes = Hero.select_by_name(@hero_name) #defines variable as the heroes that include the name the user searched
        print_heroes(heroes)
        prompt_user
    end
    input = gets.strip.downcase
  end
  puts " "
  puts "Thank you - Goodbye!"
end



end
