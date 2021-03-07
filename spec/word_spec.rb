require 'rspec'
require 'word'
require 'definitions'

describe '#Word' do
  
  before(:each) do
    Word.clear()
  end

  # Read
  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  # Create
  describe('#save') do
    it("save a word") do
      word = Word.new("star", nil)
      word.save()
      word2 = Word.new("wars", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#==') do
    it("it is the same word if it has the same attributes as another word") do
      word = Word.new("star", nil)
      word2 = Word.new("star", nil)
      expect(word).to(eq(word2))
    end
  end

  # Delete
  describe('.clear') do
    it("clears all words") do
      word = Word.new("star", nil)
      word.save()
      word2 = Word.new("wars", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("star", nil)
      word.save()
      word2 = Word.new("wars", nil)
      word2.save()
      expect(Word.find(word2.id)).to(eq(word2))
    end
  end

  # Update
  describe('#update') do
    it("updates a word by id") do
      word = Word.new("star", nil)
      word.save()
      word.update("jedi")
      expect(word.word).to(eq("jedi"))
    end
  end

  # Delete
  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new("star", nil)
      word.save()
      word2 = Word.new("wars", nil)
      word2.save()
      word2.delete()
      expect(Word.all).to(eq([word]))
    end
  end

  
end
