require 'spec_helper'

describe Product do

  describe 'validations' do
    it 'must have a name' do
      expect(Product.new(name: nil)).to_be invalid
    end
    # What does validate_uniqueness_of actually test?
    it 'must not accept duplicate names' do
      product1 = Product.create(name: "Panda")
      expect(Product.create(name: "Panda")).to validate_uniqueness_of(:name)
    end
    it 'must have a price' do
      expect(Product.new(price: nil)).to_be invalid
    end
    # What does validate_numericality_of actually test?
    it 'must not accept a string price' do
      expect(Product.create(price: "a")).to validate_numericality_of(:price)
    end
    it 'must accept a number price' do
    end
  end
end
