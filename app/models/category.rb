class Category < ActiveRecord::Base

  validates_presence_of :description

  # scope
  scope :order_by_description, -> {order(:description) }

end
