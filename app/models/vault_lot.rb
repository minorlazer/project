class VaultLot < ActiveRecord::Base
  belongs_to :order
  belongs_to :category
  scope :starts_with, -> (name) { where('name like ?', "#{name}%") }
  validates :name, :price, :quantity, presence: true

  mount_uploader :image, VaultImageUploader

  def self.search(params)
    if params[:category_id].to_i == 0
      @vault_name = VaultLot.where('name like ?', "%#{params[:keywords]}%")
    else
      keywords = params[:keywords]
      @vault_name = VaultLot.where('name like ? and category_id = ?',
                                   "%#{keywords}%", params[:category_id])
    end
  end

  def self.filter(params)
    if params[:filter] == 'On Sale'
      @vault_name = VaultLot.where('price like ?', '%.5%')
    else
      @vault_name = VaultLot.where(updated_at: 3.days.ago..Time.zone.now)
    end
  end
end
