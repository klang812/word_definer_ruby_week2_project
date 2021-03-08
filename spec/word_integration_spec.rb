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
      visit('/')
      click_on("Let's Do This!")
      fill_in('new_word', :with => 'star')
      click_on("Let's add this word!")
      expect(page).to have_content('star')
    end
  end

  

end
