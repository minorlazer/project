class Category < ActiveRecord::Base
  has_many :vault_lots
  validates :description, presence: true
  def display_name
    description
  end

  def self.categories_for_select
    categories = all
    descriptions = [['All', 0]]
    categories.each do |row|
      descriptions << [row.description,row.id]
    end
    descriptions
  end
end
