namespace :utils do
  namespace :populate do

    desc "Members Creation"
    task members: :environment do
      puts "Creating Members..."
      100.times do
        member = Member.new(
            email: Faker::Internet.email,
            password: "123456",
            password_confirmation: "123456")
      end
      puts "Creating Members...[SUCCESS]"
    end



    ##################################################

    desc "Ads Creation"
    task ads: :environment do
      puts "Creating of ads..."
      100.times do
        Ad.create!(
            title: Faker::Lorem.sentence([2,3,4,5].sample),
            description: Faker::Lorem.sentence([2,3].sample),
            member: Member.all.sample,
            category: Category.all.sample
        )
      end
      puts "Creating of ads...[SUCCESS]"
    end
  end

=begin
  desc "Exemplo"
  task populate: :environment do
  end
=end
end



