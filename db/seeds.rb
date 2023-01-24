# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "
  ============================
   Clearing DB.
  ============================
"
Result.destroy_all
User.destroy_all
Infection.destroy_all
ResultsInfection.destroy_all
Link.destroy_all

puts "
  ============================
   DB cleared.
  ============================
"

require "open-uri"
require "faker"

avatars = %w[
  http://res.cloudinary.com/dxco8as6m/image/upload/v1672791963/Artboards_Diversity_Avatars_by_Netguru-49_hqecwp.png
  http://res.cloudinary.com/dxco8as6m/image/upload/v1672791962/Artboards_Diversity_Avatars_by_Netguru-02_emimjc.png
  http://res.cloudinary.com/dxco8as6m/image/upload/v1672791962/Artboards_Diversity_Avatars_by_Netguru-16_jbb89p.png
  http://res.cloudinary.com/dxco8as6m/image/upload/v1672791962/Artboards_Diversity_Avatars_by_Netguru-59_khdhli.png
  http://res.cloudinary.com/dxco8as6m/image/upload/v1672791962/Artboards_Diversity_Avatars_by_Netguru-48_wixbci.png
  http://res.cloudinary.com/dxco8as6m/image/upload/v1672791962/Artboards_Diversity_Avatars_by_Netguru-17_asu5y0.png
  http://res.cloudinary.com/dxco8as6m/image/upload/v1672791962/Artboards_Diversity_Avatars_by_Netguru-58_qlue2f.png
  http://res.cloudinary.com/dxco8as6m/image/upload/v1672791962/Artboards_Diversity_Avatars_by_Netguru-15_hihfpx.png
  http://res.cloudinary.com/dxco8as6m/image/upload/v1672791962/Artboards_Diversity_Avatars_by_Netguru-29_szqvrz.png
  http://res.cloudinary.com/dxco8as6m/image/upload/v1672791961/Artboards_Diversity_Avatars_by_Netguru-28_iv916o.png
]

gender = [
  "Man",
  "Cis Man",
  "Trans Man",
  "Woman",
  "Cis Woman",
  "Trans Woman",
  "Non-binary",
  "Non-conforming",
  "Prefer to not say",
  "Other identity"
]
orientation = [
  "Straight (heterosexual)",
  "Gay",
  "Lesbian",
  "Bisexual",
  "Asexual",
  "Unsure",
  "Prefer to not say",
  "Other preference"
]

# Main users
puts "
  ============================
  🌱 Seeding main USERS...
  ============================
"

adam =
  User.create!(
    first_name: "Adam",
    last_name: "D",
    email: "adam@example.com",
    nickname: "Drenny",
    gender: "Man",
    date_of_birth: "1988-06-12",
    location: "Melbourne",
    orientation: "Gay",
    password: "123456",
    is_doctor: false
  )
adam.avatar.attach(
  io:
    URI.open(
      "https://res.cloudinary.com/dxco8as6m/image/upload/v1672791962/Artboards_Diversity_Avatars_by_Netguru-29_szqvrz.png"
    ),
  filename: "user.png",
  content_type: "image/png"
)
adam.save

reuben =
  User.create!(
    first_name: "Reuben",
    last_name: "F",
    email: "reuben@example.com",
    nickname: "Reubs",
    gender: "Man",
    date_of_birth: "1988-06-12",
    location: "Melbourne",
    orientation: "Straight (heterosexual)",
    password: "123456",
    is_doctor: false
  )
reuben.avatar.attach(
  io:
    URI.open(
      "https://res.cloudinary.com/dxco8as6m/image/upload/v1672791958/Artboards_Diversity_Avatars_by_Netguru-33_cwrlqd.png"
    ),
  filename: "user.png",
  content_type: "image/png"
)
reuben.save

zhenni =
  User.create!(
    first_name: "Zhenni",
    last_name: "Z",
    email: "zhenni@example.com",
    nickname: "Zen",
    gender: "Woman",
    date_of_birth: "1988-06-12",
    location: "Melbourne",
    orientation: "Straight (heterosexual)",
    password: "123456",
    is_doctor: false
  )
zhenni.avatar.attach(
  io:
    URI.open(
      "https://res.cloudinary.com/dxco8as6m/image/upload/v1672791959/Artboards_Diversity_Avatars_by_Netguru-19_fqd11r.png"
    ),
  filename: "user.png",
  content_type: "image/png"
)
zhenni.save

dimitri =
  User.create!(
    first_name: "Dimitri",
    last_name: "M",
    email: "dimitri@example.com",
    nickname: "Dims",
    gender: "Man",
    date_of_birth: "1988-06-12",
    location: "Perth",
    orientation: "Straight (heterosexual)",
    password: "123456",
    is_doctor: false
  )
dimitri.avatar.attach(
  io:
    URI.open(
      "https://res.cloudinary.com/dxco8as6m/image/upload/v1672791961/Artboards_Diversity_Avatars_by_Netguru-05_fekwf2.png"
    ),
  filename: "user.png",
  content_type: "image/png"
)
dimitri.save

puts "
  ============================
  ✅ Main USERS complete.
  ============================
"

# Community users
puts "
  ============================
  🌱 Seeding community USERS...
  ============================
"

10.times do |user|
  first_name = Faker::Name.first_name
  user =
    User.create!(
      first_name: first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email(name: first_name),
      nickname: Faker::Hipster.word,
      gender: gender.sample,
      date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 45).to_s,
      location: Faker::Address.city,
      orientation: orientation.sample,
      password: "123456",
      is_doctor: false
    )
  user.avatar.attach(
    io: URI.open(avatars.sample),
    filename: "user.png",
    content_type: "image/png"
  )
  user.save
end

puts "
  ============================
  ✅ Community USERS complete.
  ============================
"

# Doctors
puts "
  ============================
  🌱 Seeding DOCTORS...
  ============================
"

10.times do |doctor|
  first_name = Faker::Name.first_name
  doctor =
    User.create!(
      first_name: first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email(name: first_name),
      nickname: Faker::Alphanumeric.alphanumeric(number: 8).upcase,
      gender: gender.sample,
      orientation: orientation.sample,
      password: "123456",
      is_doctor: true,
      provider_number: Faker::Alphanumeric.alphanumeric(number: 8).upcase
    )
  doctor.avatar.attach(
    io: URI.open(avatars.sample),
    filename: "user.png",
    content_type: "image/png"
  )
  doctor.save
end

puts "
  ============================
  ✅ DOCTORS complete.
  ============================
"

# Infections
puts "
  ============================
  🦠 Adding INFECTIONS data...
  ============================
"

gono =
  Infection.create!(
    {
      name: "Gonorrhoea",
      description:
        "Gonorrhea is an STD that can cause infection in the genitals, rectum, and throat. It is very common, especially among young people ages 15-24 years."
    }
  )
chlam =
  Infection.create!(
    {
      name: "Chlamydia",
      description:
        "Chlamydia is a common STD that can cause infection among both men and women. It can cause permanent damage to a woman's reproductive system. This can make it difficult or impossible to get pregnant later."
    }
  )
hepb =
  Infection.create!(
    {
      name: "Hepatitis_B",
      description:
        "Hepatitis B is a vaccine-preventable liver infection caused by the hepatitis B virus (HBV). Hepatitis B is spread when blood, semen, or other body fluids from a person infected with the virus enters the body of someone who is not infected."
    }
  )
hepc =
  Infection.create!(
    {
      name: "Hepatitis_C",
      description:
        "Hepatitis C is a liver infection caused by the hepatitis C virus (HCV). Hepatitis C is spread through contact with blood from an infected person. Today, most people become infected with the hepatitis C virus by sharing needles or other equipment used to prepare and inject drugs."
    }
  )
syph =
  Infection.create!(
    {
      name: "Syphilis",
      description:
        "Syphilis is a sexually transmitted disease (STD) caused by the bacterium Treponema pallidum. Syphilis can cause serious health effects without adequate treatment."
    }
  )
hiv =
  Infection.create!(
    {
      name: "HIV",
      description:
        "HIV (human immunodeficiency virus) is a virus that attacks the body’s immune system. If HIV is not treated, it can lead to AIDS (acquired immunodeficiency syndrome)."
    }
  )

puts "
  ============================
  ✅ INFECTIONS data complete.
  ============================
"

# Results
puts "
  ============================
  🌱 Seeding RESULTS data...
  ============================
"

20.times do |result|
  test_date = Faker::Date.between(from: 7.days.ago, to: Date.today)
  result =
    Result.create!(
      user_id: User.all.where(is_doctor: false).sample.id,
      doctor_id: User.all.where(is_doctor: true).sample.id,
      test_date: test_date.to_s,
      next_test_date: (test_date + 7).to_s
    )
end

puts "
  ============================
  ✅ RESULTS data complete.
  ============================
"

# ResultsInfections
puts "
  ============================
  🌱 Associating RESULTS+INFECTIONS
  ============================
"

results = Result.all

20.times do |analysis|
  date = Faker::Date.between(from: 7.days.ago, to: Date.today)

  result = results.sample
  existing_infection_ids = result.results_infections.pluck(:infection_id)

  infection_id = Infection.pluck(:id).sample
  while existing_infection_ids.include?(infection_id)
    infection_id = Infection.pluck(:id).sample
  end

  analysis =
    ResultsInfection.create!(
      result_id: result.id,
      infection_id: infection_id,
      is_treated: [true, false].sample
    )

  if analysis.is_treated?
    analysis.start_date = date
    analysis.end_date = date + 7
    analysis.status = "negative/non-reactive"
  else
    analysis.start_date = date + 7
    analysis.end_date = date + 14
    analysis.status = "positive/reactive"
  end
  analysis.save
end

puts "
  ============================
  ✅ Associations complete.
  ============================
"

puts "
  ============================
  Ready to go. 👍
  ============================
"
