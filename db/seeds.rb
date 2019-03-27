# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create([
    {
        name: 'Food',
        enable: true
    },
    {
        name: 'Furniture',
        enable: true
    },
    {
        name: 'Electronic',
        enable: true
    }
])

Image.create([
    {
        name: 'Image1',
        enable: true
    },
    {
        name: 'Image2',
        enable: true
    },
    {
        name: 'Image3',
        enable: true
    }
])