class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create do |order|
    order.line_items.each do |line_item|
      if product = Product.find_by(id: line_item.product_id)
        # product.decrement(:quantity, by = 1)
        product.quantity -= line_item.quantity
        product.save
      end
    end
  end

end
