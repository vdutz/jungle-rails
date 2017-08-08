require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can click the add-to-cart button from homepage and their cart should increase by one" do
    # ACT
    visit root_path
    # page.find('header > h4').click
    first('.btn.btn-primary').click
    # find_link(href: ‘/cart/add_item?product_id=1’).click

    # DEBUG
    sleep 3
    save_screenshot

    # VERIFY
    within('.nav.navbar-nav.navbar-right') { expect(page).to have_content('My Cart (1)') }
  end

end
