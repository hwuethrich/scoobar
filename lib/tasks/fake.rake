 namespace :fake do

  desc 'Generate fake customers'
  task :customers do

    countries = {
      'de'    => 'Germany',
      'de-CH' => 'Switzerland',
      'de-AT' => 'Austria',
      'fr'    => 'France',
      'it'    => 'Italy',
      'en-US' => 'United States of America'
    }

    100.times do
      Faker::Config.locale = countries.keys.sample

      attrs = {
        # Personal
        first_name:    Faker::Name.first_name,
        last_name:     Faker::Name.last_name,
        date_of_birth: Date.today - (10.years + rand(365 * 70).days),
        gender:        ['male', 'female'].sample,
        email:         Faker::Internet.email,
        phone_number:  Faker::PhoneNumber.phone_number,

        # Address
        address1:      Faker::Address.street_address,
        address2:      Faker::Address.secondary_address,
        city:          Faker::Address.city,
        state:         Faker::Address.state,
        post_code:     Faker::Address.postcode,
        country:       countries[Faker::Config.locale]
      }

      Customer.create! attrs
    end
  end

end
