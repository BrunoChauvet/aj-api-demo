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
  end
end
