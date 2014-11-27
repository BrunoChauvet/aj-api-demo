require 'spec_helper'

describe Story do
	describe '.from_feed' do
    let(:stories) { JSON.parse(File.read('spec/fixtures/stories/en_latest.json')) }

    it 'parses the stories feed' do
      Story.from_feed(stories)

      expect(Story.count).to eql(50)
      story = Story.first
      expect(story.meta_values.count).to eql(16)
    end
  end
end