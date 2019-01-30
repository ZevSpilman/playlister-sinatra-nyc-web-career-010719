class Genre < ActiveRecord::Base
has_many :song_genres
has_many :artists, through: :songs
has_many :songs, through: :song_genres


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
  formatted = Genre.find_by_slug_helper(slug)
  Genre.find_by_name(formatted)
end


end
