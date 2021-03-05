require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @word = Word.all
  erb(:words)
end

get('/new_words') do
  @word = Word.all()
  erb(:new_words)
end

post('/new_words') do
  words = params[:word]
  word = Word.new(words, nil)
  word.save()
  @word = Word.all()
  erb(:new_words)
end

get('/:id') do
  @word = Word.find(params[:id].to_i())
  puts @word
  erb(:new_words)
end