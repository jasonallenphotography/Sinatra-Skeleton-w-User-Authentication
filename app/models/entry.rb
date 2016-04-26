class Entry < ActiveRecord::Base
  validates :title, :body, presence: true
  belongs_to :user
  has_many :entry_tags
  has_many :tags, through: :entry_tags

end
