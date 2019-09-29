# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

messages = [
  {
    first_name: 'Matilda',
    last_name: 'Morrisson',
    email: 'matilda@example.com',
    amount: 250.56
  },
  {
    first_name: 'Sara',
    last_name: 'Morr',
    email: 'saraa@example.com',
    amount: 1000
  },
  {
    first_name: 'Garry',
    last_name: 'Stivense',
    email: 'stivense@example.com',
    amount: 5400
  },
  {
    first_name: 'Carrie',
    last_name: 'Stivenson',
    email: 'carrie@example.com',
    amount: 4301
  },
  {
    first_name: 'Bron',
    last_name: 'Beggar',
    email: 'bron@example.com',
    amount: 2500
  }
]
Message.create(messages)
