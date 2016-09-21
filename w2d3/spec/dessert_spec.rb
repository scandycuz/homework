require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)!
 Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:brownie) { Dessert.new("brownie", 100) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      brownie.add_ingredient('barley')
    end

    it "adds an ingredient to the ingredients array" do
      expect(brownie.ingredients).to include('barley')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['barley', 'wheat', 'hay']

      ingredients.each do |ingredient|
        brownie.add_ingredient(ingredient)
      end
      brownie.mix!

      expect(brownie.ingredients).to_not eq(ingredients)
    end

  end

  describe "#eat" do

    it "subtracts an amount from the quantity" do
      expect(brownie.eat(50)).to eq(50)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(150) }.to raise_error("not enough left!")
    end
  end
end
