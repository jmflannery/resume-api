# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Toke::User.create(
  username: 'jack',
  password: 'jjjjjj',
  password_confirmation: 'jjjjjj'
)

address = Rez::Address.create(
  building_number: '22',
  street_name: 'Elm St',
  secondary_address: 'Apt 213',
  city: 'Hillsdale',
  state: 'CA',
  zip_code: '90284',
  county: 'Los Angeles',
  country: 'USA',
  area_code: '818',
  phone_number: '345-8374'
)

profile = Rez::Profile.create(
  firstname: 'Hon',
  middlename: 'Franken',
  lastname: 'Anders',
  nickname: 'The Ders',
  prefix: 'Mr',
  suffix: 'II',
  title: 'Developer'
)

Rez::Resume.create(
  name: 'Developer Resume',
  address: address,
  profile: profile
)

Rez::Resume.create(
  name: 'Railroad Resume',
  address: address,
  profile: profile
)

