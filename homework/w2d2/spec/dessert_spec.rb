require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:tiramisu) {Dessert.new("tiramisu", 100, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(tiramisu.type).to eq("tiramisu")
    end

    it "sets a quantity" do
      expect(tiramisu.quantity).to eq(100)
    end
    it "starts ingredients as an empty array" do
      expect(tiramisu.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("tiramisu", "100", chef)}.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"do
      tiramisu.add_ingredient("egg")
      expect(tiramisu.ingredients.include?("egg")).to eq(true)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      before_copy = tiramisu.ingredients.dup
      tiramisu.mix!
      expect(before_copy != tiramisu.ingredients).to eq(false)
    end
  end

  describe "#eat" do
    before(:each)do
      # before_quant = tiramisu.quantity
      tiramisu.eat(10)
    end
    it "subtracts an amount from the quantity" do
      expect(tiramisu.quantity).to eq(90)
    end

    it "raises an error if the amount is greater than the quantity"do
      expect{Dessert.new("tiramisu", 100, chef).eat(110)}.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"do
      allow(chef).to receive(:titleize)
      expect(tiramisu.serve).to eq(" has made 100 tiramisus!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"do
    allow(chef).to receive(:bake)
    expect(chef).to receive(:bake).with(tiramisu)
    tiramisu.make_more
    end
  end
end
