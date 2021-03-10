require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('test integration specs') do
  
  before(:each) do
    Word.clear()
    Definitions.clear()
  end

  describe('create a new_word path', {:type => :feature}) do
    it('adds a word when no words are listed') do
      visit('/words/')
      click_on("Let's Do This!")
      fill_in('new_word', :with => 'star')
      click_on("Let's add this word!")
      expect(page).to have_content('star')
    end
  end

  describe('create a definition path', {:type => :feature}) do
    it('creates a definition and goes to the word it belongs to') do
      word = Word.new("star", nil)
      word.save
      visit("/words/#{word.id}")
      fill_in('add_definition', :with => 'bright')
      click_on('Lets add it!')
      expect(page).to have_content('bright')
    end
  end

  describe('change a word', {:type => :feature}) do
    it('changes an existing word') do
      word = Word.new("star", nil)
      word.save
      visit("/words/#{word.id}")
      fill_in('edit_word', :with => 'supernova')
      click_on('Update your word')
      expect(page).to have_content('supernova')
    end
  end

  



end
