require 'httparty'

class TreyAPI
  IP = File.read "./ip"

  include HTTParty
  base_uri IP

  def say_ah
    TreyAPI.get("/say_ah")
  end

  def random_ah
    TreyAPI.get("/say_ah/random")
  end

  def add_phrase
    TreyAPI.post("/new_phrase")    
  end

  def random_sub_and_voice
    TreyAPI.get("/user_phrase/:id")    
  end
end