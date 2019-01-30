class Artist < ActiveRecord::Base
has_many :songs
has_many :genres, through: :songs

 def slug
   self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
 end

 def self.find_by_slug_helper(slug)
   slug = slug.split("-")
   slug.map do |word|
     word.capitalize
   end.join(" ")

 end

 def self.find_by_slug(slug)
   formatted = Artist.find_by_slug_helper(slug)
   Artist.find_by_name(formatted)
 end

end
