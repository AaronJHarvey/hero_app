class Api
def self.get_hero(hero_name)
## What is my endpoint?
url = "https://superheroapi.com/api/10221861033137565/search/#{hero_name}"
## How do I go there and get what I need?
response = HTTParty.get(url).to_s
heroes = JSON.parse(response)["results"]
## how do I handle that json and turn it into meaningful data?
heroes.each do |hero_details|
name = hero_details["name"]
id = hero_details["id"]
  Hero.new(name: name, id: id)
end


end
def self.getHeroDetails(character) #character object
## what is my endpoint?
url = "https://superheroapi.com/api/10221861033137565/#{character.id}"
## How do I go there and get what I need?
response = HTTParty.get(url).to_s
## How do I parse the response?
character_details = JSON.parse(response)["biography"]
##What do I want to do from there?
## add an attribute to EXISTING character obj.
character.biography =  character_details
end

end

#service file/class. Responsible for communicating with API -
#going out to it, getting my information, and returning it
