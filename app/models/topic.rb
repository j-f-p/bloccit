class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :sponsors, dependent: :destroy
end
