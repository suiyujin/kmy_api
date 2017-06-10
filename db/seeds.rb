# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
User.create({
    twitter_id: '873611564548464640',
    name: 'りんな',
    screen_name: 'rinna0613',
    location: '東京 西国分寺',
    description: '早実/1-2/2-3/ダンス部/kis my ft2',
    geo_enabled: true,
    profile_image_url: 'http://pbs.twimg.com/profile_images/873612604958048256/2TJVVeHd_normal.jpg',
    favorite_place: '東京 千代田区'
})
