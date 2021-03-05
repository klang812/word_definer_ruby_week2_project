require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @word = Word.all
  erb(:words)
end

get('/definitions') do
  @word = Word.all
  erb(:definitions)
end