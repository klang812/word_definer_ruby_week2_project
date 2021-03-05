class Definitions
  attr_reader :id
  attr_accessor :word, :word_id

  @@definitions = {}
  @@id = 0

  def initialize(definition, word_id, id)
    @definition = definition
    @word_id = word_id
    @id = id || @@id += 1
  end

  def ==(compare_definition)
    (self.definition() == compare_definition.definition()) && (self.word_id() == compare_definition.word_id())
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definitions.new(self.definition, self.word_id, self.id)
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(word, word_id)
    self.word = word
    self.word_id = word_id
    @@definitions[self.id] = Definitions.new(self.definition, self.word_id, self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
  end
end

  