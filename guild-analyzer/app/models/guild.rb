class Guild < ApplicationRecord
  validates :server, presence: true
  validates :name, presence: true, uniqueness: true
end
