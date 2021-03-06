require 'rspec'
require 'definitions'
require 'word'
require 'pry'

describe '#Definitions' do
  
  before(:each) do
    @word = Word.new("star", nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definitions.new("bright", @word.id, nil)
      definition2 = Definitions.new("bright", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definitions.new("bright", @word.id, nil)
      definition.save()
      definition2 = Definitions.new("not good", @word.id, nil)
      definition2.save()
      expect(Definitions.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definitions.new("bright", @word.id, nil)
      definition.save()
      definition2 = Definitions.new("not good", @word.id, nil)
      definition2.save()
      Definitions.clear()
      expect(Definitions.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definitions.new("bright", @word.id, nil)
      definition.save()
      expect(Definitions.all).to(eq([definition]))
    end
  end


end
 