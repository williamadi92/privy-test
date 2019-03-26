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

Product.create([
    {
        name: 'Soto',
        description: 'This is Soto',
        enable: true
    },
    {
        name: 'Chair',
        description: 'This is Chair',
        enable: true
    },
    {
        name: 'Handphone',
        description: 'This is Handphone',
        enable: true
    }
])