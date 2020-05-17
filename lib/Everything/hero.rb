class Hero
attr_accessor :name, :biography

@@all = []

def initialize(name:, biography:)
@name = name
@biography = biography
@@all << self
end

def self.all
  @@all
end

end
