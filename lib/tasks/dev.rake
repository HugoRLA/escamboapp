namespace :dev do

  desc "Setup/Reset Enviroment"
  task setup_env: :environment do
  puts "Setup/Reset Enviroment..."
    path_images = Rails.root.join('public', 'system')
    puts "Drop Database... #{%x(rake db:drop)}"
    puts "Delete Images... #{%x(rm -rf #{path_images})}"
    puts "Init Database... #{%x(rake db:create)}"
    puts "Migrations Database... #{%x(rake db:migrate)}"
    puts "Populate Database..."
    puts %x(rake db:seed)
    puts %x(rake dev:populate:members)
    puts %x(rake dev:populate:ads)
  puts "Setup/Reset Enviroment...[SUCCESS]"
  end

  namespace :populate do

    desc "Members Creation"
    task members: :environment do
      puts "Creating Members..."
      25.times do
        Member.create!(
            email: Faker::Internet.email,
            password: "123456",
            password_confirmation: "123456")
      end
      puts "Creating Members...[SUCCESS]"
    end



    ##################################################

    desc "Ads Creation"
    task ads: :environment do
      puts "Creating Ads..."

      5.times do
        Ad.create!(
            title: Faker::Lorem.sentence([2,3,4,5].sample),
            description_md: Faker::Markdown.sandwich(6, 3) ,
            description_short: Faker::Lorem.sentence([2,3].sample),
            member: Member.first,
            category: Category.all.sample,
            price: "#{Random.rand(500)},#{Random.rand(99)}",
            finish_date: Date.today + Random.rand(99),
            picture: File.new(Rails.root.join('public', 'templates', 'imagesAds', "#{Random.rand(9)}.jpg"), 'r')
        )
      end

      50.times do
        Ad.create!(
            title: Faker::Lorem.sentence([2,3,4,5].sample),
            description_md: Faker::Markdown.sandwich(6, 3) ,
            description_short: Faker::Lorem.sentence([2,3].sample),
            member: Member.all.sample,
            category: Category.all.sample,
            price: "#{Random.rand(500)},#{Random.rand(99)}",
            finish_date: Date.today + Random.rand(99),
            picture: File.new(Rails.root.join('public', 'templates', 'imagesAds', "#{Random.rand(9)}.jpg"), 'r')
        )
      end
      puts "Creating Ads...[SUCCESS]"
    end
  end

=begin
  desc "Exemplo"
  task populate: :environment do
  end
=end
end



