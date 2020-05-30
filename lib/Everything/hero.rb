

class Hero
attr_accessor :name, :biography, :id

@@all = []

def initialize(name:, id:)
@name = name
@id = id
@@all << self
end

def self.all
@@all
end

def self.select_by_name(name)
  self.all.select {|hero| hero.name.downcase.include?name}
end


end
