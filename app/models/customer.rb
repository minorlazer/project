class Customer < ActiveRecord::Base
  belongs_to :province
  has_many :orders

  validates :first_name, :last_name, :street, :city, presence: true

end
