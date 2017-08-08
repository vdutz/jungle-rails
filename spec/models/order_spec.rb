require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @category = Category.new(name: "Home")
      @product1 = Product.create!(
        name: "Swiffer",
        description: "Cleaning mop",
        image: "https://cdn.messenger.pgsitecore.com/en-us/-/media/Swiffer/Images/Products/Primary/Sweeper---XL_hero_01_v3.png?h=940&la=en-US&w=940&v=1-201605191541",
        price_cents: 2500,
        quantity: 23,
        category: @category
      )
      @product2 = Product.create!(
        name: "Aerogarden",
        description: "Indoor herb garden",
        image: "https://images-na.ssl-images-amazon.com/images/I/71O10d5wtHL._SX355_.jpg",
        price_cents: 30500,
        quantity: 13,
        category: @category
      )
      # Setup at least one product that will NOT be in the order
    end

    it 'deducts quantity from products based on their line item quantities' do
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'testemail@test.com',
        total_cents: 500,
        stripe_charge_id: 'ch_1AnZwkJmJPMDgGVHjLZ26OLH'
      )
      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 1,
        item_price: @product1.price_cents,
        total_price: @product1.price_cents * 1
      )
      @order.line_items.new(
        product: @product2,
        quantity: 2,
        item_price: @product2.price_cents,
        total_price: @product2.price_cents * 2
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      @product3.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(22)
      expect(@product2.quantity).to eq(11)
    end

    it 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
      @order = Order.new(
        email: 'testemail@test.com',
        total_cents: 500,
        stripe_charge_id: 'ch_1AnZwkJmJPMDgGVHjLZ26OLH'
      )
      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 1,
        item_price: @product1.price_cents,
        total_price: @product1.price_cents * 1
      )
      @order.save!
      @product1.reload
      @product2.reload
      # Test
      expect(@product2.quantity).to eq(13)
    end

  end
end

# create_table "orders", force: :cascade do |t|
#   t.integer  "total_cents"
#   t.datetime "created_at",       null: false
#   t.datetime "updated_at",       null: false
#   t.string   "stripe_charge_id"
#   t.string   "email"
# end