class Guild < ApplicationRecord

  validates :name, :server, presence: true, uniqueness: true
end
