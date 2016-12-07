namespace :db do
  desc "Fill database with sample data"
  task :sample_data => :environment do
    make_users
    make_categories
    make_tasks
  end
end

def make_users
  Rake::Task['db:reset'].invoke
      50.times do |n|
       inn="90909090909090"
       passport="ЕР 678899"
       tel="098984546"
       role="admin"
       first_name = Faker::Superhero.name
       password="some67"
       descr = Faker::Hipster.sentences
       email= Faker::Internet.email
       photo="http://fakeimg.pl/300/"
        User.create!(first_name: first_name,
                     last_name: first_name,
                     tel: tel,
                     inn: inn,
                     passport: passport,
                     description: descr,
                     email: email,
                     password: password,
                     :role =>role,
                     :password_confirmation =>password,
                     :photo=> photo
        )
      end
end

def make_tasks

  50.times do |n|
    category=Random.rand(1...50)
    user=Random.rand(1...50)
    cost=Random.rand(1000...50000)
    name = Faker::ChuckNorris.fact
    descr = Faker::Hipster.sentence
    place = Faker::Address.street_address

    Task.create!(:title => name,
                 :body => descr,
                 :location => place,
                 :category_id => category,
                 :cost => cost,
                 :user_id => user)
  end
end

def make_categories

  50.times do |n|

    name = Faker::ChuckNorris.fact


    Category.create!(
        :body => name
    )
  end
end