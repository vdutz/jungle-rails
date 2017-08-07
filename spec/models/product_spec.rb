require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations:' do
    # validation tests/examples here

    before :each do
      @category = Category.new(name: "Gardening")
      @product = Product.new(
        name: "Swiffer",
        description: "Cleaning mop",
        image: "https://cdn.messenger.pgsitecore.com/en-us/-/media/Swiffer/Images/Products/Primary/Sweeper---XL_hero_01_v3.png?h=940&la=en-US&w=940&v=1-201605191541",
        price_cents: 2500,
        quantity: 23,
        category: @category
      )
    end

    it 'should save succesfully if all four required fields are present' do
      # @product.save
      expect(@product.save).to eq(true)
    end

    it 'should not save if name is not present' do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'should not save if price_cents is not present' do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'should not save if quantity is not present' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'should not save if category is not present' do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end

  end
end

# create_table "products", force: :cascade do |t|
#   t.string   "name"
#   t.text     "description"
#   t.string   "image"
#   t.integer  "price_cents"
#   t.integer  "quantity"
#   t.datetime "created_at",  null: false
#   t.datetime "updated_at",  null: false
#   t.integer  "category_id"
# end