require 'httparty'

class TreyAPI
  IP = File.read "./ip"

  include HTTParty
  base_uri IP

  def initialize
    
  end

  def add_phrase
    TreyAPI.post("/new_phrase")    
  end
end