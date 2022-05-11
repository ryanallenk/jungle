require 'rails_helper'

RSpec.describe Product, type: :model do
it "is valid" do
  @product = Product.new
  @category = Category.new
  @category.name = "Test"
  @product.name = "Test"
  @product.price_cents = 12999
  @product.quantity = 4
  @product.category = @category
  expect(@product.valid?).to be true
end

it 'should have a name' do
  @product = Product.new(name: nil)
  @product.valid?
  expect(@product.errors.full_messages).to include("Name can't be blank")
end

it 'should have a price' do
  @product = Product.new(price_cents: nil)
  @product.valid?
  expect(@product.errors.full_messages).to include("Price can't be blank")
end

it 'should have a quantity' do
  @product = Product.new(quantity: nil)
  @product.valid?
  expect(@product.errors.full_messages).to include("Quantity can't be blank")
end

it 'should have a category' do
  @product = Product.new(category: nil)
  @product.valid?
  expect(@product.errors.full_messages).to include("Category can't be blank")
end


end
