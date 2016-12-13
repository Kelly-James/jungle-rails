class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  has_many :reviews
  belongs_to :category

  validates :name, presence: true
  validates :price,
    presence: true,
    numericality: true
  validates :quantity,
    presence: true,
    numericality: { only_integer: true }
  validates :category, presence: true

  accepts_nested_attributes_for :reviews

  def sold_out?
    self.quantity < 1
  end

end
