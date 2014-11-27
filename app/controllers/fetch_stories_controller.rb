class FetchStoriesController < ApplicationController
  def index
    Aljazeera::ApiClient.new.fetch_stories
  end
end
