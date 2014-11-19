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
      JSON.parse(response.body)['stories'].map{|story_hash| Story.new(
          guid: story_hash['guid'],
          link: story_hash['link'],
          title: story_hash['title']["#cdata-section"],
          description: story_hash['description']["#cdata-section"],
          body: story_hash['body']["#cdata-section"],
          largeimage: story_hash['largeimage'],
          smallimage: story_hash['smallimage'],
          video: story_hash['video'],
          source: story_hash['source']["#cdata-section"],
          pubDate: story_hash['pubDate'],
          author: story_hash['author']
        )}
    end
  end
end