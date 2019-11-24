# frozen_string_literal: true

d1= Doctor.create(name: "physiotherapist", email: "physiotherapist@gmail.com", password: "password")
d1.save
d2= Doctor.create(name: "MBBS", email: "mbbs@gmail.com", password: "password")
d2.save
d3= Doctor.create(name: "cardiologist", email: "cardiologist@gmail.com", password: "password")
d3.save
d4= Doctor.create(name: "MD", email: "md@gmail.com", password: "password")
d4.save
d5= Doctor.create(name: "neurologist", email: "neurologist@gmail.com", password: "password")
d5.save

p1 = Patient.create(name: "patient 1", email: "patient1@gmail.com", password: "password")
p1.save
p2 = Patient.create(name: "patient 2", email: "patient2@gmail.com", password: "password")
p2.save

unavailability.create(date: Date.today , slot: 1, doctor_id: d1.id)
unavailability.create(date: Date.today + 1, slot: 2, doctor_id: d2.id)
unavailability.create(date: Date.today + 2, slot: 3, doctor_id: d3.id)
