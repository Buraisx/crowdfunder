Pledge.destroy_all
Reward.destroy_all
User.destroy_all
Project.destroy_all

User.create(first_name: "Gus", last_name: "Jaker", email: "gusjaker@gus.gus", password: "12345678", password_confirmation: "12345678")
category_array = ["Techno", "Puppies", "Fungi", "Cereal", "Eyepatches", "Magic" ]

category_array.each do |categor|
  Category.create!(name: categor)
end

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: 'password',
    password_confirmation: 'password'
  )
end

10.times do |x|
  user = User.all.sample
  category = Category.all.sample
  project = Project.create!(
              title: Faker::App.name,
              description: Faker::Lorem.paragraph,
              goal: rand(100000),
              start_date: Time.now.utc,
              end_date: Time.now.utc + rand(10).days,
              user_id: user.id,
              category_id: category.id
            )

  5.times do
    project.rewards.create!(
      description: Faker::Superhero.power,
      dollar_amount: 1 + rand(100),
    )
  end
end

20.times do
  project = Project.all.sample
  Pledge.create!(
    user: (User.all - [project.user]).sample,
    project: project,
    dollar_amount: project.rewards.sample.dollar_amount + rand(10) + 1
  )
end
