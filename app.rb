require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definitions')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/new_words') do
  @word = Word.all()
  erb(:new_words)
end

post('/new_words') do
  words = params[:new_word]
  word = Word.new(words, nil)
  word.save()
  @word = Word.all()
  erb(:new_words)
end

get('/:id') do
  @word = Word.find(params[:id].to_i())
  @definitions = Definitions.find_by_word(@word.id)
  erb(:word)
end

patch('/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:edit_word])   
  @words = Word.all
  erb(:words)
end

delete("/:id") do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)  
end


get('/:id/definitions/:definition_id') do
  @definition = Definitions.find(params[:definition_id].to_i())
  erb(:definition)
end


post('/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  @definition = Definitions.new(params[:add_definition], @word.id, nil)
  @definition.save()
  @definitions = Definitions.find_by_word(@word.id)
  erb(:word)
end

patch('/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definitions.find(params[:definition_id].to_i())
  @definition.update(params[:edit_definition], @word.id)   # change word from form
  @definitions = Definitions.find_by_word(@word.id)
  erb(:word)
end

delete("/:id/definitions/:definition_id") do
  @word = Word.find(params[:id].to_i())
  @definition = Definitions.find(params[:definition_id].to_i())
  @definition.delete()
  @definitions = Definitions.find_by_word(@word.id)
  erb(:word)  
end



