require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.new(:name => "New_Category", :created_at => DateTime.now, :updated_at => DateTime.now)
      @product = Product.new(:name => "New_Product", :category => @category, :quantity => 12, :price_cents => 1200)
    end

    it "Validates presence" do
      expect(@product.valid?).to eql(true)
    end

    it 'Has a name on creation' do
      @product.name = nil
      @product.valid?
      expect(@product.errors[:name]).to include("can't be blank")
    end

    it "Has a price on creation" do
      @product.price_cents = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Price cents is not a number", "Price can't be blank", "Price is not a number")
  end

    it "Quantity it both true" do
      @product.quantity = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
  end

    it "Product belongs to a category" do
      @product.category = nil
      @product.valid?
      expect(@product.errors.full_messages).to include ("Category can't be blank")
  end

end
end
