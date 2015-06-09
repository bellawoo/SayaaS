require 'httparty'

class TreyAPI
  # IP = File.read "./ip"

  include HTTParty
  base_uri "10.1.10.33:4567"

  def say_ah
    TreyAPI.get("/say_ah")
  end

  def random_ah
    TreyAPI.get("/say_ah/random")
  end

  def add_phrase submission
    phrase = submission.to_sym
    TreyAPI.post("/new_phrase/#{phrase}")    
  end

      # GithubAPI.get("/orgs/#{org_name}/members")

  def random_sub_and_voice
    TreyAPI.get("/user_phrase/:id")    
  end
end

v = TreyAPI.new

v.add_phrase("Say this now.")