class Category < ActiveRecord::Base
  has_many :vault_lots
end
