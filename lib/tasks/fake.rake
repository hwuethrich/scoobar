 namespace :fake do

  def generate(model, &block)
    count = ENV.fetch('count', 100).to_i

    print 'Generating %d %s ' % [count, model.name.pluralize]

    count.times do |i|
      print '.'
      model.create! block.call
    end

    puts ' DONE'
  end

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

    generate Customer do
      Faker::Config.locale = countries.keys.sample

      {
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
    end
  end

  desc 'Generate fake events'
  task :events do
    generate Event do
      start_time = (-10 + rand(20)).days.from_now.to_date + 8.hours + (rand(4) * 2).hours

      {
        name:          Faker::Company.catch_phrase,
        start_time:    start_time,
        duration:      30 + 15 * rand(6),
        description:   Faker::Lorem.paragraphs(rand(2)).join("\n\n")
      }
    end
  end

end
