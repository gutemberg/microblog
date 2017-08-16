class Profile < ApplicationRecord
  has_one :user
  has_many :posts

  accepts_nested_attributes_for :user,
    :allow_destroy => true
end
