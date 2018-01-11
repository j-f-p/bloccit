# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

 require 'random_data'

 # Create Posts
 50.times do |i|
  if i%5 == 0
   Post.create!(
     title:  "SPAM",
     body:   RandomData.random_paragraph
   )
  else
   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
  end
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 