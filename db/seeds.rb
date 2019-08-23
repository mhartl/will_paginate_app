100.times do |n|
  name  = "Test User #{n}"
  email = "user#{n}@example.com"
  User.create!(name:  name,
               email: email)
end
