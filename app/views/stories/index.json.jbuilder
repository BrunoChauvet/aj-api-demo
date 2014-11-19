json.array!(@stories) do |story|
  json.extract! story, :id, :guid, :link, :title, :description, :body, :largeimage, :smallimage, :source, :author
  json.url story_url(story, format: :json)
end
