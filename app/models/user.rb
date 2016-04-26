class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :author_name, :password, :email, presence: true, on: :create
  validates :password, length: { minimum: 4, maximum: 20 }, on: :create
  validates :author_name, :email, presence: true, on: :update

  has_secure_password
  has_many :tags
  has_many :entries

end
