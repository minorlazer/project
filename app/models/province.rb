class Province < ActiveRecord::Base
  has_many :customers

  validates :name, :pst, :gst, :hst, presence: true

  def self.provinces_for_select
    provinces = all
    descriptions = []
    provinces.each do |row|
      descriptions << [row.name, row.id]
    end
    descriptions
  end
end
