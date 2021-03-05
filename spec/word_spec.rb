require 'rspec'
require 'word'

describe '#Word' do
  
  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("save a word") do
      word = Word.new("star", nil, nil)
      word.save()
      word2 = Word.new("wars", nil, nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#==') do
    it("it is the same word if it has the same attributes as another word") do
      word = Word.new("star", nil, nil)
      word2 = Word.new("star", nil, nil)
      expect(word).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("star", nil, nil)
      word.save()
      word2 = Word.new("wars", nil, nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

end
