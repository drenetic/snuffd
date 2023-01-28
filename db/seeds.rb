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

reuben =
  User.create!(
    first_name: "Reuben",
    last_name: "Frith",
    email: "reuben@doctor.com",
    nickname: "Reubs",
    gender: "Man",
    date_of_birth: "1988-12-12",
    location: "Melbourne",
    orientation: "Straight (heterosexual)",
    password: "123456",
    is_doctor: true,
    provider_number: "XYZ1286BA"
  )
reuben.avatar.attach(
  io:
    URI.open(
      "https://res.cloudinary.com/dxco8as6m/image/upload/v1672791962/Artboards_Diversity_Avatars_by_Netguru-29_szqvrz.png"
    ),
  filename: "user.png",
  content_type: "image/png"
)
reuben.save

zhenni =
  User.create!(
    first_name: "Zhenni",
    last_name: "Zhou",
    email: "zhenni@patient.com",
    nickname: "Zen",
    gender: "Woman",
    date_of_birth: "1988-06-06",
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
    last_name: "Mastrantonis",
    email: "dimitri@patient.com",
    nickname: "Dims",
    gender: "Man",
    date_of_birth: "1993-11-04",
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

adam =
  User.create!(
    first_name: "Adam",
    last_name: "Drenetic",
    email: "adam@patient.com",
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
      "https://res.cloudinary.com/dxco8as6m/image/upload/v1672791959/Artboards_Diversity_Avatars_by_Netguru-19_fqd11r.png"
    ),
  filename: "user.png",
  content_type: "image/png"
)
adam.save

roberto =
  User.create!(
    first_name: "Roberto",
    last_name: "Costello",
    email: "rob@patient.com",
    nickname: "Robo",
    gender: "Man",
    date_of_birth: "1988-06-06",
    location: "Adelaide",
    orientation: "Straight (heterosexual)",
    password: "123456",
    is_doctor: false
  )
roberto.avatar.attach(
  io:
    URI.open(
      "https://res.cloudinary.com/dxco8as6m/image/upload/v1672791959/Artboards_Diversity_Avatars_by_Netguru-19_fqd11r.png"
    ),
  filename: "user.png",
  content_type: "image/png"
)
roberto.save

john =
  User.create!(
    first_name: "John",
    last_name: "Abrahams",
    email: "john@patient.com",
    nickname: "Abs",
    gender: "Man",
    date_of_birth: "1988-06-06",
    location: "Adelaide",
    orientation: "Gay",
    password: "123456",
    is_doctor: false
  )
john.avatar.attach(
  io:
    URI.open(
      "https://res.cloudinary.com/dxco8as6m/image/upload/v1672791959/Artboards_Diversity_Avatars_by_Netguru-19_fqd11r.png"
    ),
  filename: "user.png",
  content_type: "image/png"
)
john.save


puts "
  ============================
  ✅ Main USERS complete.
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
        "Gonorrhea is a curable STD that can cause infection in the genitals, rectum, and throat. It is very common, especially among young people ages 15-24 years.",
      duration: 7
    }
  )
chlam =
  Infection.create!(
    {
      name: "Chlamydia",
      description:
        "Chlamydia is a curable, common STD that can cause infection among both men and women. It can cause permanent damage to a woman's reproductive system. This can make it difficult or impossible to get pregnant later.",
      duration: 7
    }
  )
hepb =
  Infection.create!(
    {
      name: "Hepatitis_B",
      description:
        "Hepatitis B is a vaccine-preventable liver infection caused by the hepatitis B virus (HBV). Hepatitis B is spread when blood, semen, or other body fluids from a person infected with the virus enters the body of someone who is not infected. While preventable through vaccination, it is not curable if you have the condition.",
      duration: 183
    }
  )
hepc =
  Infection.create!(
    {
      name: "Hepatitis_C",
      description:
        "Hepatitis C is a curable liver infection caused by the hepatitis C virus (HCV). Hepatitis C is spread through contact with blood from an infected person. Today, most people become infected with the hepatitis C virus by sharing needles or other equipment used to prepare and inject drugs.",
      duration: 183
    }
  )
syph =
  Infection.create!(
    {
      name: "Syphilis",
      description:
        "Syphilis is a curable sexually transmitted disease (STD) caused by the bacterium Treponema pallidum. Syphilis can cause serious health effects without adequate treatment.",
      duration: 21
    }
  )
hiv =
  Infection.create!(
    {
      name: "HIV",
      description:
        "HIV (human immunodeficiency virus) is a virus that attacks the body’s immune system. If HIV is not treated, it can lead to AIDS (acquired immunodeficiency syndrome).",
      duration: 0
    }
  )
  hsv =
  Infection.create!(
    {
      name: "Genital Herpes",
      description:
        "Genital herpes is an incurable infection caused by the herpes simplex virus (HSV) and can often be spread by skin-to-skin contact during sexual activity. Some people infected with the virus may have very mild symptoms or no symptoms, however, they can still spread the virus to others.",
      duration: 0
    }
  )
  hpv =
  Infection.create!(
    {
      name: "Human Papillomavirus",
      description:
        "Human Papillomavirus (HPV) is an vaccine-preventable infection that causes warts in various parts of the body, depending on the strain. Many people with HPV don't develop any symptoms but can still infect others through sexual contact. While preventable through vaccination, it is not curable if you have the condition. ",
      duration: 0
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

result1 = Result.create!(
    user_id: dimitri.id,
    doctor_id: reuben.id,
    test_date: Date.new(2022,3,25),
    next_test_date: (Date.new(2022,3,25) + 14).to_s
  )

result2 = Result.create!(
    user_id: dimitri.id,
    doctor_id: reuben.id,
    test_date: Date.new(2022,9,10),
    next_test_date: (Date.new(2022,9,10) + 9).to_s
  )

result3 = Result.create!(
    user_id: dimitri.id,
    doctor_id: reuben.id,
    test_date: Date.new(2023,1,1),
    next_test_date: (Date.new(2023,1,1) + 7).to_s
  )

result4 = Result.create!(
    user_id: roberto.id,
    doctor_id: reuben.id,
    test_date: Date.new(2022,12,25),
    next_test_date: (Date.new(2022,12,25) + 14).to_s
  )

result5 = Result.create!(
    user_id: adam.id,
    doctor_id: reuben.id,
    test_date: Date.new(2022,9,12),
    next_test_date: (Date.new(2022,9,12) + 10).to_s
  )

result5 = Result.create!(
    user_id: john.id,
    doctor_id: reuben.id,
    test_date: Date.new(2022,5,10),
    next_test_date: (Date.new(2022,5,10) + 14).to_s
  )

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
result = Result.all
infections = Infection.all

result1_infection1a = ResultsInfection.create!(
  result_id: result1.id,
  status: "positive",
  infection_id: gono.id,
  start_date: result1.test_date,
  end_date: result1.test_date + gono.duration.days,
  is_treated: true
)

result1_infection1b = ResultsInfection.create!(
  result_id: result1.id,
  status: "negative",
  infection_id: chlam.id,
  start_date: result1.test_date,
  end_date: result1.test_date + chlam.duration.days,
  is_treated: false
)

result2_infection2a = ResultsInfection.create!(
  result_id: result2.id,
  status: "positive",
  infection_id: hepb.id,
  start_date: result2.test_date,
  end_date: result2.test_date + hepb.duration.days,
  is_treated: true
)

result3_infection3a = ResultsInfection.create!(
  result_id: result3.id,
  status: "negative",
  infection_id: gono.id,
  start_date: result3.test_date,
  end_date: result3.test_date + gono.duration.days,
  is_treated: false
)

result3_infection3b = ResultsInfection.create!(
  result_id: result3.id,
  status: "positive",
  infection_id: hsv.id,
  start_date: result3.test_date,
  end_date: result3.test_date + hsv.duration.days,
  is_treated: true
)

result5_infection5a = ResultsInfection.create!(
  result_id: result5.id,
  status: "positive",
  infection_id: hepc.id,
  start_date: result5.test_date,
  end_date: result5.test_date + hepc.duration.days,
  is_treated: true
)

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
