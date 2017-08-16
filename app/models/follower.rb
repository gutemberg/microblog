class Profile < ApplicationRecord
  has_one :user
  has_many :posts
  has_many :followers, class: 'Profile' , :through => :followers

  accepts_nested_attributes_for :user,
    :allow_destroy => true
end
