# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Blog.create(title: 'Hello World', text: 'This is my first blog post!')
Blog.create(title: 'Hello Europe', text: 'This is my second blog post!')
Blog.create(title: 'Hello Switzerland', text: 'This is my third blog post!')
