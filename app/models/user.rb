class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :notes, foreign_key: :user_id
  has_many :notetags, through: :notes, source: :notetags
  has_many :tags, through: :notetags, source: :tags
end
