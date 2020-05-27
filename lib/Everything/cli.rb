class Cli

  def run
    puts " "
    puts "Hello and welcome to my Superhero Identification Application!"
    puts " "
    prompt_for_hero
    input_hero
  end





  def input_hero
    @hero_name = gets.strip.downcase
    mod_name = @hero_name.tr(" ", "_")
    Api.get_hero(mod_name)

    if Hero.all.count > 0
      ##display list of heros to the user
      print_heroes(Hero.select_by_name(@hero_name))

      ## ask them to pick hero
      prompt_user
      input = gets.strip.downcase

      while input != 'exit'

        if input == 'list'
          heroes = Hero.select_by_name(@hero_name)
          print_heroes(heroes)
          prompt_user
        elsif input.to_i > 0 && input.to_i <= Hero.select_by_name(@hero_name).length ## user chooses a character
          character = Hero.select_by_name(@hero_name)[input.to_i - 1]
          ## Get details about that character
          Api.getHeroDetails(character).to_s if !character.biography
          print_character(character)
          prompt_user
        elsif input == 'new'

          prompt_for_hero
            @hero_name = gets.strip.downcase
            mod_name = @hero_name.tr(" ", "_")
            Api.get_hero(mod_name)
            print_heroes(Hero.select_by_name(@hero_name))
            prompt_user




        else
          puts "I did not understand that input - please try again."
          prompt_user
        end

        input = gets.strip.downcase
      end
      puts " "
      puts "Thank you - GoodBye!"
    else
      #did not find heroes with api
      puts "We couldn't find info on #{@hero_name}. Please try again."
      input_hero
    end
  end





  def prompt_for_hero
    puts "Enter a hero name to see information about that hero."
    puts " "
  end

  def print_heroes(heroes)
    puts " "
    puts "Here are the different versions of #{@name}"
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
end
