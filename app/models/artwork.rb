# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string
#  image_url  :string
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :artist_id,
    message: "You can only one piece of artwork with this name"}
  validates :image_url, presence: true
  validates :artist_id, presence: true

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

  has_many :shared_artworks,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :shared_artwork,
    source: :viewer
end
