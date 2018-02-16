require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  let(:user) { create(:user) }
  
  describe '#user_posts' do
    it 'recognizes that a user has no post' do
      expect( user_posts(user) ).to eq false
    end
    
    it 'recognizes that a user has at least one post' do
      create(:post, user: user) 
      expect( user_posts(user) ).to eq true
    end
  end
  
  describe '#user_comments' do
    it 'recognizes that a user has no comment' do
      expect( user_comments(user) ).to eq false
    end
    
    it 'recognizes that a user has at least one comment' do
      create(:comment, user: user)
      expect( user_comments(user) ).to eq true
    end
  end
  
  describe '#user_fav_posts' do
    it 'recognizes that a user has no favorite' do
      expect( user_fav_posts(user) ).to eq false
    end
    
    it 'recognizes that a user has at least one favorite' do
      Favorite.create!(post: create(:post), user: user) 
      expect( user_fav_posts(user) ).to eq true
    end
  end
end
