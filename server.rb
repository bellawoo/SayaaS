require 'sinatra/base'
require 'json'
require 'pry'

Voices = [
  "veena",
  "serena",
  "oliver"
]

Phrases = []

class MyServer < Sinatra::Base
  enable :logging

  set :bind, "0.0.0.0"

  get '/say_ah' do
    system "say 'Go girl its your birthday Open wide I know you are thirsty.'"
  end

  get '/say_ah/random' do
    random_woman = Voices.sample
    system "say -v #{random_woman} 'Go girl its your birthday Open wide I know you are thirsty.'"
  end

  post '/new_phrase/:phrase' do
    Phrases.push params[:phrase]
    response = {status: :ok, id: (Phrases.length - 1)}
    JSON.unparse response
  end

  get '/user_phrase' do
    phrase   = Phrases.sample
    JSON.unparse({ id: position, phrase: phrase })
    system "say -v #{Voices.sample} '#{phrase}'"
  end
end

MyServer.run!