# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  User.destroy_all
  user1 = User.create!(username: 'Leonardo Da Vinci')
  user2 = User.create!(username: 'Vincent van Gogh' )
  user3 = User.create!(username: 'PainterLover')
  user4 = User.create!(username: 'ArtLover')

  Artwork.destroy_all
  artwork1 = Artwork.create!(title: 'Mona Lisa', image_url: 'https://www.leonardodavinci.net/images/paintingthumbs/mona-lisa.jpg', artist_id: user1.id)
  artwork2 = Artwork.create!(title: 'Starry Night', image_url: 'https://practicalpages.files.wordpress.com/2010/02/starry-night-van-gogh.jpg?w=676', artist_id: user2.id)

  ArtworkShare.destroy_all
  ArtworkShare.create([{artwork_id: artwork1.id, view_id: user3.id}, {artwork_id: artwork2.id, view_id: user4.id},
  {artwork_id: artwork1.id, view_id: user1.id}])
end
