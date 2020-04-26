class EndUser < ApplicationRecord
 acts_as_paranoid
 # validates_as_paranoid
 # validates_uniqueness_of_without_deleted :family_name, :first_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
