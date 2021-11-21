class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :postal_addresses, dependent: :destroy

  #def full_name
    #self.last_name + " " + self.first_name
  #end
  validates :last_name, uniqueness: true, length: {maximum: 20, minimum: 2}
  validates :first_name, uniqueness: true, length: {maximum: 20, minimum: 2}
  validates :last_name_jp, uniqueness: true, length: {maximum: 20, minimum: 2}
  validates :first_name_jp, uniqueness: true, length: {maximum: 20, minimum: 2}
  validates :postal_code, uniqueness: true, length: {maximum: 20, minimum: 2}
  validates :address, uniqueness: true, length: {maximum: 20, minimum: 2}
  validates :telephone_number, uniqueness: true, length: {maximum: 20, minimum: 2}
  validates :email, uniqueness: true, length: {maximum: 20, minimum: 2}


end
