namespace :drop do
  
  desc "drop create migrate seed database"
  # rake drop:all
  task :all => :environment do
    # if ActiveRecord::Base.configurations[Rails.env]
      Rake::Task['db:drop'].reenable
      Rake::Task['db:drop'].invoke
    # end

    # FileUtils.rm_rf(Dir.glob("#{Rails.root}/public/*"))

    # Rake::Task['db:create'].reenable
    Rake::Task['db:create'].invoke

    # Rake::Task['db:migrate'].reenable
    Rake::Task['db:migrate'].invoke

    # Rake::Task['db:seed'].reenable
    Rake::Task['db:seed'].invoke

    # Rake::Task['db:test:prepare'].reenable
    Rake::Task['db:test:prepare'].invoke

  end  
end