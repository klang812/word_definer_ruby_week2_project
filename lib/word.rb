class Word
  attr_reader :id
  attr_accessor :word

  # @@words = {1 => word, 2 => word, 3=> word, etc} word.word = "star"
  @@words = {}
  @@total_words = 0

  def initialize(word, id)
    @word = word
    @id = id || @@total_words +=1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(self.word, self.id)
  end

  # word.word = "star" == compare_word.word = "star"
  def ==(compare_word)
    self.word == compare_word.word()
  end

  def self.clear
    @@words = {}
    @@total_words = 0
  end

  def self.find(id)
    @@words[id]
  end

  def update(word)
    @word = word
  end

  def delete
    @@words.delete(self.id)
  end

  def definitions
    Definitions.find_by_word(self.id)
  end

end
