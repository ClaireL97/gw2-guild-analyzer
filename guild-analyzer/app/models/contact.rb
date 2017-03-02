class Contact < ApplicationRecord
  belongs_to :guild

  validates :contact_alias, :rank, presence: true
end
