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
end
 