#!/usr/bin/env rake
desc "make db and ctags"
task :init do
  Rake::Task["db:drop"].invoke
  Rake::Task["db:migrate"].invoke
  Rake::Task["db:seed"].invoke
  system "rails runner ./script/create_10_entry.rb"
  puts "###########init complete, create ctags##########"
  system "wiki-tags"
  puts "###########opening server##########"
  system "rails s"
end
