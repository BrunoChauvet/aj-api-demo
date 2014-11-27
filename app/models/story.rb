class Story < ActiveRecord::Base
	has_many :meta_values

	def self.from_feed(hash)
		hash['stories'].each do |story_hash|
			next if Story.find_by_guid(story_hash['guid'])
			
			story = Story.create(
        guid: story_hash['guid'],
        link: story_hash['link'],
        title: story_hash['title'] ? story_hash['title']["#cdata-section"] : nil,
        description: story_hash['description'] ? story_hash['description']["#cdata-section"] : nil,
        body: story_hash['body'] ? story_hash['body']["#cdata-section"] : nil,
        largeimage: story_hash['largeimage'],
        smallimage: story_hash['smallimage'],
        video: story_hash['video'],
        source: story_hash['source'] ? story_hash['source']["#cdata-section"] : nil,
        pubDate: story_hash['pubDate'],
        author: story_hash['author']
      )

			if story_hash['metadata']
	      meta_types = story_hash['metadata'].keys
	      meta_types.each do |type|
	      	values = Array.wrap(story_hash['metadata'][type])
	      	values.each do |mata_values|
						MetaValue.create(story: story, meta_type: type, meta_value: mata_values['@value'])
	      	end
	      end
      end
		end
	end
end
