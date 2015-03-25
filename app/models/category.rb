class Category < ActiveRecord::Base
  has_many :vault_lots

  def display_name
    description
  end
end
