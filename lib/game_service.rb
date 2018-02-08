require 'rest-client'

class GameService
  def self.fetch_data
    resp = RestClient.get 'http://172.31.181.80:8010/gsinfo'
    result = JSON.parse(resp)
    # puts result
    result
  end
end