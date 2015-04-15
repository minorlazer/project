class Customer < ActiveRecord::Base
  belongs_to :province
  has_many :orders

  validates :first_name, :last_name, :street, :city, presence: true

  def self.new_customer(params)
    @new_customer = Customer.create(first_name: params[:first_name],
                                    last_name: params[:last_name],
                                    street: params[:street],
                                    city: params[:city],
                                    province_id: params[:province_id],
                                    phone_number: params[:phone_number])
  end
end
