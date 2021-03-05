require('sinatra')
require('sinatra/reloader')
require('./lib/word')
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
  erb(:word)
end

patch('/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:edit_word])   # change word from form
  @words = Word.all
  erb(:words)
end

delete("/:id") do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)  
end