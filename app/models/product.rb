class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :order_items
  default_scope { where(active:true) }

  validates :title, :description, :quantity, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }

  validates :quantity, numericality: {greater_than: 0}
  validates :picture, presence: true
  # has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
