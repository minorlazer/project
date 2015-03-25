class VaultLot < ActiveRecord::Base
  belongs_to :order
  belongs_to :category

end
