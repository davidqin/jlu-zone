#!/usr/bin/env rake

desc "make db"
namespace :db do
  task :init do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
    system "rails runner ./script/create_10_entry.rb"
    puts "###########init complete,opening server##########"
    system "rails s"
  end
end

desc "make db with bundle"
task :init do
  system "bundle install"
  Rake::Task["db:drop"].invoke
  Rake::Task["db:migrate"].invoke
  Rake::Task["db:seed"].invoke
  puts "###########init complete, now opening server##########"
  system "rails s"
end
