require 'rspec'
require 'word'

describe '#Word' do
  
  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end
end