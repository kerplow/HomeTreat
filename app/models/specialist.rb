class Specialist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # mount_uploader :photo, PhotoUploader

  has_many :treatments
  has_many :subcategories, through: :treatments
  has_many :appointments, through: :treatments
  has_many :reviews
end
