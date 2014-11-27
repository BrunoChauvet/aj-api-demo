module Aljazeera
  class ApiClient
    def initialize
      @client = Faraday.new(:url => 'http://devapi.aljazeera.com') do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end

    def fetch_stories
      response = @client.get "/v1/en/stories/latest?format=json&apikey=#{ENV['AJ_API_KEY']}"
      Story.from_feed JSON.parse(response.body)
    end
  end
end