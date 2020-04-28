class EndUser < ApplicationRecord
 acts_as_paranoid
 # validates_as_paranoid
 # validates_uniqueness_of_without_deleted :family_name, :first_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :kana_family_name, presence: true
  validates :kana_first_name, presence: true
  validates :email, presence: true
  validates :post_number, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
end
