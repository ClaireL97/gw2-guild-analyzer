class Guild < ApplicationRecord
  has_many :contacts, dependent: :destroy

  validates :server, presence: true
  validates :name, presence: true, uniqueness: true
end
