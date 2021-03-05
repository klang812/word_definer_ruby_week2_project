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
  erb(:new_word)
end

post('/new_words') do
  words = params[:new_word]
  word = Word.new(words, nil)
  word.save()
  @word = Word.all()
  erb(:new_words)
end