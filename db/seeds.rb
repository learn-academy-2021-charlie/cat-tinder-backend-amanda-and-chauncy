# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

characters = [
    {
        name:'Anchovy',
        animal: 'Bird',
        enjoys:'Playing',
        personality:'Lazy'
    },
    {
        name:'Audie',
        animal: 'Fox',
        enjoys:'Fitness',
        personality:'Peppy'
    },
    {
        name:'Chops',
        animal: 'Pig',
        enjoys:'Education',
        personality:'Smug'
    }
]

characters.each do |attributes|
	Character.create attributes
	puts 'creating character #{attributes}'
end