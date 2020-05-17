
class Api
def self.get_hero(hero_name)
## What is my endpoint?
url = "https://superheroapi.com/api/10221861033137565/search/#{hero_name}"
## How do I go there and get what I need?
response = HTTParty.get(url).to_s
## how do I handle that json and turn it into meaningful data?
results = JSON.parse(response)["results"]
## how do I make hero OBJECT from that data?
results.each do |hero_details|
  name = hero_details["name"]
  biography = hero_details["biography"]
Hero.new(name: name, biography: biography)
end
binding.pry
end
end

#service file/class. Responsible for communicating with API -
#going out to it, getting my information, and returning it
