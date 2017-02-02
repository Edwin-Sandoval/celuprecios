class Phone < ApplicationRecord
  belongs_to :brand
  has_many :articles

  validates :name, presence: true, uniqueness: true
end
