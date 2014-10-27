 namespace :fake do

  def generate(model, &block)
    count = ENV.fetch('count', 100).to_i

    print 'Generating %d %s ' % [count, model.name.pluralize]

    count.times do |i|
      print '.'
      model.create! block.call(i)
    end

    puts ' DONE'
  end

  def random_certification_name
    ['PADI OW', 'PADI AOW', 'PADI RD'].sample
  end

  desc 'Generate fake customers'
  task :customers => :environment do

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
        country:       countries[Faker::Config.locale],

        # Certification
        certification_name: random_certification_name,
        certification_date: rand(300).days.ago,
        last_dive_on:       rand(300).days.ago,
        number_of_dives:    rand(100),
      }
    end
  end

  desc 'Generate fake events'
  task :events => :environment do
    trips = [] + Trip.all

    generate Event do
      start_time = (-10 + rand(20)).days.from_now.to_date + 8.hours + (rand(4) * 2).hours

      trip = trips.sample

      {
        name:          trip ? nil : Faker::Company.catch_phrase,
        start_time:    start_time,
        duration:      30 + 15 * rand(6),
        description:   Faker::Lorem.paragraphs(rand(2)).join("\n\n"),
        trip:          trips.sample
      }
    end
  end

  desc 'Generate fake trips'
  task :trips => :environment do

    COLORS = ['#428bca', '#5cb85c', '#5bc0de', '#f0ad4e', '#d9534f']

    def random_color
      COLORS.sample
    end

    generate Trip do |i|
      {
        code: 'T%0d' % (i+1),
        name: 'Trip %0d' % (i+1),
        color: random_color
      }
    end
  end

end
