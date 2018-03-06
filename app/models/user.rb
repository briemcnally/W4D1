# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    foreign_key: :artist_id,
    class_name: :Artwork,
    dependent: :destroy

  has_many :shared_artworks,
    through: :artworks,
    source: :shared_artworks,
    dependent: :destroy

  has_many :artwork_shared_viewers,
    foreign_key: :view_id,
    class_name: :ArtworkShare
end
