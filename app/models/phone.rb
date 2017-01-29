class Phone < ApplicationRecord
  belongs_to :brand
  has_many :articles
end
