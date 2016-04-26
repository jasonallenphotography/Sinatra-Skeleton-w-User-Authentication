class Tag < ActiveRecord::Base
  validates :title, :user_id, presence: true
  validates :title, uniqueness: true
  belongs_to :user
  has_many :entry_tags
  has_many :entries, through: :entry_tags
end