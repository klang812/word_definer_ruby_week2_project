class Word
  attr_reader :id, :word

  @@words = {}

  def initialize(word, id)
    @word = word
    @id = id
  end

  def self.all
    @@words.values()
  end
  



end
