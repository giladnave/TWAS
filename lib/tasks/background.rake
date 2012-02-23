namespace :background do

  desc "Test this"
  task :test => :environment do 
    puts "Hello"
    puts Bid.all
  end
end
