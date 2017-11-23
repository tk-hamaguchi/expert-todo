class User < ApplicationRecord

  belongs_to :tenant

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  validates :name,
    presence:   true

  validates :email,
    presence:   true,
    uniqueness: { case_sensitive: false },
    email:      true

end
