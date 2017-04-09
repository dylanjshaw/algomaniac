class Note < ApplicationRecord
  belongs_to :user
  has_many :notetags

  validates :content, presence: true
end
