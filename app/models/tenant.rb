class Tenant < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :name,
    length: {
      in: 1..255
    },
    presence:   true

end
