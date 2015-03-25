class VaultLot < ActiveRecord::Base
  belongs_to :order
  belongs_to :category

  scope :starts_with, -> (name) { where("name like ?", "#{name}%") }
end
