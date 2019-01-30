class Song < ActiveRecord::Base
has_many :song_genres
has_many :genres, through: :song_genres
belongs_to :artist

def slug
  self.name.downcase.gsub(' ', '-')
end

  def self.find_by_slug_helper(slug)
    slug = slug.split("-")
    slug.map do |word|
      word.capitalize
    end.join(" ")
  end

  def self.find_by_slug(slug)
    formatted = Song.find_by_slug_helper(slug)
    # binding.pry
    Song.find_by_name(formatted)
  end


end
