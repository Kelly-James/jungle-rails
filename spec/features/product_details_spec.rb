require 'rails_helper'

RSpec.feature "Visitor navigates to the product page", type: :feature, js: true do

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

  scenario 'They see one product' do

    visit '/products/1'

    save_screenshot

    expect(page).to have_content('Average Rating')

    puts page.html

  end

end
