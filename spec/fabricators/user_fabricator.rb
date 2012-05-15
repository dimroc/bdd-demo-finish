Fabricator(:user) do
  email { Faker::Internet.email }
  password { Faker::Lorem.sentence }
end
