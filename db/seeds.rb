# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(username: "Lameck")
User.create(username: "Shirley")
User.create(username: "Nancy")
User.create(username: "Edith")
User.create(username: "Irene")

Event.create(title: "House Warming", description: "Just moved into a new house. I am inviting all my friends to come help me celebrate the achievement!", location: "Palace appartments HNO: 1", schedule: "2021-1-15 17:00", creator_id: 1)
Event.create(title: "My Birthday", description: "30th Jan is my birthday. Come all. The party is gonna be big!!", location: "My place", schedule: "2021-1-30 19:00", creator_id: 2)
Event.create(title: "Graduation Homecoming Party", description: "This coming March I will be graduating from the university. A very interesting homecoming party have been organised. Please don't miss.", location: "Blessing Hotel", schedule: "2021-3-1 09:00", creator_id: 3)
Event.create(title: "The Scrabble Championship", description: "Bring your smart brains for rounds of scrabbling. Lot's of prizes to be won", location: "At our homestead", schedule: "2021-3-9 08:00", creator_id: 4)
Event.create(title: "Baby Shower", description: "I know you have all been noticing the bump. Baby shower is 20th of March. DON'T MISS!", location: "Heights Appartments", schedule: "2021-3-20 16:00", creator_id: 5)

EventAttendance.create(attendee_id: 5, attended_event_id: 1)
EventAttendance.create(attendee_id: 4, attended_event_id: 5)
EventAttendance.create(attendee_id: 1, attended_event_id: 3)
EventAttendance.create(attendee_id: 2, attended_event_id: 3)
EventAttendance.create(attendee_id: 5, attended_event_id: 3)
