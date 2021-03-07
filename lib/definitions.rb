class Definitions
  attr_reader :id
  attr_accessor :definition, :word_id

  @@definitions = {}
  @@id = 0

  # definition = Definitions.new("bright", 1, nil)
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

  def self.clear
    @@definitions = {}
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(definition, word_id)
    self.definition = definition
    self.word_id = word_id
    @@definitions[self.id] = Definitions.new(self.definition, self.word_id, self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.find_by_word(new_word_id)
    definitions = []
    @@definitions.values.each do |new_definition|
      if new_definition.word_id == new_word_id
        definitions.push(new_definition)
      end
    end
    definitions
  end

  def word
    Word.find(self.word_id)
  end
end



