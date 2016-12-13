require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before :each do
      @category = Category.create
    end

    it 'should be valid if all fields are not nil' do
      @product = Product.create(name: 'Teddy Bear',
                                price: 4.99,
                                quantity: 1,
                                category: @category)
      expect(@product.errors.full_messages.length).to be(0)
    end

    it 'should be invalid without a product name' do
      @product = Product.create(name: nil,
                                price: 39.99,
                                quantity: 2,
                                category: @category)
      expect(@product.errors.full_messages).to_not include("can't be blank")
    end

    it 'should be invalid without a price' do
      @product = Product.create(name: 'Teddy Bear',
                                price: nil,
                                quantity: 100,
                                category: @category)
      expect(@product.errors.full_messages).to_not include("is not a number",
                                                       "can't be blank")
    end

    it 'should be invalid without a quantity' do
      @product = Product.create(name: 'Teddy Bear',
                                price: 99.99,
                                quantity: nil,
                                category: @category)
      expect(@product.errors.full_messages).to_not include("must be an integer",
                                                       "is not a number",
                                                       "can't be blank")
    end

    it 'should be invalid quantity is not a number' do
      @product = Product.create(name: 'Teddy Bear',
                                price: 99.99,
                                quantity: 'A String',
                                category: @category)
      expect(@product.errors.full_messages).to_not include("is not a number",
                                                       "can't be blank")
    end

    it 'should be invalid without a category' do
      @product = Product.create(name: 'Teddy Bear',
                                price: 100.00,
                                quantity: 1,
                                category: nil)
      expect(@product.errors.full_messages).to_not include("can't be blank")
    end

  end

end
