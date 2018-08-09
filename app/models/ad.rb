class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  # validates
  validates :title, :description, :category, :picture, :finish_date, presence: true
  validates :price, numericality: { :greater_than => 0 }
  # paperclip
  has_attached_file :picture, styles: { large: "900x400#", medium: "320x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # gem money-rails
  monetize :price_cents

  # scope

  scope :descending_order, -> (quantity = 10) {order(created_at: :desc).limit(quantity)}
  scope :of_the, -> (member) {where(member: member)}

end
