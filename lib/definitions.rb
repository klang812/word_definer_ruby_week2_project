class Definitions
  attr_reader :id
  attr_accessor :definition, :word

  @@definitions = {}
  @@id = 0

  def initialize(definition, word, id)
    @definition = definition
    @word = word
    @id = id || @@id += 1
  end

  def ==(compare_definition)
    (self.definition() == compare_definition.definition()) && (self.word() == compare_definition.word())
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definitions.new(self.definition, self.word, self.id)
  end

  def self.clear
    @@definitions = {}
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(definition, word)
    self.definition = definition
    self.word = word
    @@definitions[self.id] = Definitions.new(self.definition, self.word, self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.find_by_word(new_word_id)
    definitions = []
    @@definitions.values.each do |new_definition|
      if new_definition.word == new_word_id
        definitions.push(new_definition)
      end
    end
    definitions
  end

end



