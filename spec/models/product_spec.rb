require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @category = Category.new(name: 'Food')
    @category.save
  end

  describe 'Validations' do

    it "product with all four fields set will indeed save successfully" do
      @product = Product.new(name: 'Hot Dog', price: 499, quantity: 50, category: @category)
      expect(@product).to be_valid
    end

    it "product with no name will not save successfully" do
      @product = Product.new(name: nil, price: 499, quantity: 50, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "product with no price will not save successfully" do
      @product = Product.new(name: 'Hot Dog', price: '', quantity: 50, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it "product with no quantity will not save successfully" do
      @product = Product.new(name: 'Hot Dog', price: 499, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "product with no category will not save successfully" do
      @product = Product.new(name: 'Hot Dog', price: 499, quantity: 50, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
