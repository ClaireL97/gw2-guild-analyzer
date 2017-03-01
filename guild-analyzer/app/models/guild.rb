class Guild < ApplicationRecord
  has_many :contacts
  validates :server, presence: true
  validates :name, presence: true, uniqueness: true
end
