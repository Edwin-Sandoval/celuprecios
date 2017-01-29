class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file :photo, styles: { normal: "200x250>", mini: "30x30>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  has_many :articles
  has_many :publications
  has_many :comments
  has_many :questions
  include PermissionsConcern
end
