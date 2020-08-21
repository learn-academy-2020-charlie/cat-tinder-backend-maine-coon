# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cats = [
    {
        name: "Atilla",
        age: 5,
        enjoys: "passive agression and knocking things off tables.",
        image: "https://cdn.now.howstuffworks.com/media-content/e7ce44e1-a8cf-4db3-8807-9bd387a88931-1024-576.jpg"
    },
    {
        name: "Boots",
        age: 2,
        enjoys: "murdering small mammals and birds.",
        image: "https://i0.wp.com/www.alcohollywood.com/wp-content/uploads//pussnboots.jpg?fit=1200%2C675&ssl=1"
    },
    {
        name: "Kylo Ren",
        age: 9,
        enjoys: "angsty moods and useless panoramic shots.",
        image: "https://www.metro.us/wp-content/uploads/2020/03/kitty-ren_1-1200x660.jpg"
    },
    {
        name: "Kanye",
        age: 3,
        enjoys: "lying in sunny spots of the house.",
        image: "https://i.pinimg.com/originals/69/e6/d7/69e6d7ec8e43a34df2d58d7d1e4f970d.jpg"
    },
    {
        name: "Mr. Cat",
        age: 8,
        enjoys: "Dancing and dancing and running and playing.",
        image: "https://d.newsweek.com/en/full/611195/omar-maine-coon.jpg?w=1600&h=1200&q=88&f=a2ef8789ff87decbd51167e87167cd51"
    },
    {
        name: "Cat in the Hat",
        age: 11,
        enjoys: "Rhyming and philosophy.",
        image: "https://p0.pikrepo.com/preview/984/379/white-and-black-cat-wearing-santa-hat.jpg"
    },
    {
        name: "Ca'tain Hook",
        age: 34,
        enjoys: "Eating Ca'tain Crunch!",
        image: "https://cdn.shopify.com/s/files/1/0344/6469/products/font-b-Cat-b-font-Clothes-Stand-Transformation-Qiu-Dong-Outfit-Custom-The-Short-font_copy_grande_ac74fd81-1c7a-418d-b3cd-aabd7fee0108_grande.jpg?v=1571438626"
    }
]

cats.each do |attributes|
    Cat.create attributes
    puts "creating cat #{attributes}"
end

puts "We have cats!"