class Group < ApplicationRecord
  has_many :groups_users
  has_many :users, through: :groups_users
  has_many :messages

  accepts_nested_attributes_for :groups_users

end
