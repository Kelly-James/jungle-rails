require 'rails_helper'

RSpec.feature "Visitor can add product to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
      name: 'shirt' + n.to_s,
      description: Faker::Hipster.paragraph(4),
      quantity: 10,
      image: open_asset('apparel1.jpg'),
      price: 64.99
      )
    end
  end

  scenario 'User sees that the cart counter updates' do

    visit root_path

    click_on("Add", :match => :first)

    within '#navbar' do
      expect(page).to have_link('My Cart (1)')
    end
    expect(page.current_path).to eq('/')
  end

end
