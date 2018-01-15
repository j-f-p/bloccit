 module RandomData
     
   def self.random_paragraph
     sentences = []
     rand(4..6).times do
       sentences << random_sentence
     end
 
     sentences.join(" ")
   end
 
   def self.random_sentence
     random_statement.capitalize + "."
   end
   
   def self.random_question
     random_statement.capitalize + "?"
   end
   
   def self.random_statement
     strings = []
     rand(3..8).times do
       strings << random_word
     end
 
     return strings.join(" ")
   end
 
   def self.random_word
     letters = ('a'..'z').to_a
     letters.shuffle!
     letters[0,rand(3..8)].join
   end
 end
 