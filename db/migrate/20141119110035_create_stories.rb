class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :guid
      t.text :link
      t.text :title
      t.text :description
      t.text :body
      t.text :largeimage
      t.text :smallimage
      t.text :video
      t.text :source
      t.text :pubDate
      t.text :author

      t.timestamps
    end
    add_index(:stories, :guid, :unique => true)

    create_table :meta_values do |t|
      t.belongs_to :story
      t.text :meta_type
      t.text :meta_value
    end
    add_foreign_key(:meta_values, :stories)
    add_index(:meta_values, :story_id, :unique => false)

  end
end
