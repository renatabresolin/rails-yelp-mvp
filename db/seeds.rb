Restaurant.destroy_all

10.times do
  Restaurant.create!(
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    category: %w(chinese italian japanese french belgian).sample,
    phone_number: Faker::PhoneNumber.phone_number
  )
end
