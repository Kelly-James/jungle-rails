class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  has_many :reviews
  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  validates :user_id, presence: true
  accepts_nested_attributes_for :reviews

  def sold_out?
    self.quantity < 1
  end

end
