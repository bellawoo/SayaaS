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

  get '/say_hello' do
    system "say 'Hello world'"
  end

  get '/say_ah' do
    system "say 'Go girl its your birthday Open wide I know you are thirsty.'"
  end

  get '/say_ah/random' do
    random_woman = Voices.sample
    system "say -v #{random_woman} 'Go girl its your birthday Open wide I know you are thirsty.'"
  end

  post '/new_phrase' do
    Phrases.push params[:phrase]
    response = {status: :ok, id: (Phrases.length - 1)}
    JSON.unparse response
  end

  get '/user_phrase/:id' do
    position = params[:id].to_i
    phrase   = Phrases[position]
    JSON.unparse({ id: position, phrase: phrase })
    system "say '#{phrase}'"
  end

  # List of all ideas
  # get '/idea_list' do
  #   headers["Content-Type"] = "application/json"
  #   JSON.unparse Database
  # end

  # post '/new_idea' do
  #   Database.push params[:idea]
  #   response = { status: :ok, id: (Database.length - 1) }
  #   JSON.unparse response
  # end

  # get '/idea/:id' do
  #   position = params[:id].to_i
  #   idea     = Database[position]
  #   JSON.unparse({ id: position, idea: idea })
  # end

  # get '/idea' do
  #   Database.sample
  # end
end

MyServer.run!