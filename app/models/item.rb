class Item < ApplicationRecord
  has_many :item_tags
  has_many :tags, through: :item_tags
  belongs_to :user
  
  enum category: ["Book", "Movie", "TV Show", "Video", "Game", "Article", "Song", "Documentary"]
  enum status: ["To Read", "To Watch", "To Play", "Read", "Watched", "Played"]
  enum priority: ["Low", "Medium", "High"]
  enum rating: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  
  def all_tags=(names)
    self.tags = names.split(" ").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(" ")
  end
end