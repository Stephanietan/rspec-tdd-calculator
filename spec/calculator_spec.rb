require 'spec_helper'
require_relative '../lib/calculator.rb'

describe Calculator do
  before(:context) do
    # initialize calculator
    @my_calculator = Calculator.new(1)
  end

describe "Initialisation" do
  it 'an instance of Calculator class' do
    expect(@my_calculator).to be_instance_of(Calculator)
  end
  it 'should equal 1' do
    expect(@my_calculator.my_calculator).to eq(1)
  end
end

describe "Results" do
  it "return the current results only" do
    expect(@my_calculator.results).to eq(1)
  end
  it "should not be able to set" do
    @my_calculator.results = 5 if respond_to? :results=
    expect(@my_calculator.results).to eq(1)
  end
end

describe "Reset" do
  it "reset the calculator to X" do
    @my_calculator.reset(0)
    expect(@my_calculator.results).to eq(0)
  end
end

describe "Addition" do
  it "add X to internal result value" do
    @my_calculator.add(2)
    expect(@my_calculator.results).to eq(2)
  end
  it "should be valid number" do
    expect(@my_calculator.add("y")).to eq(false)
  end
end

describe "Subtraction" do
  it "subtract X to internal result value" do
    @my_calculator.subtract(1)
    expect(@my_calculator.results).to eq(1)
  end
  it "should be valid number" do
    expect(@my_calculator.subtract("y")).to eq(false)
  end
end

describe "Multiply" do
  it "multiply X to internal result value" do
    @my_calculator.multiply(6)
    expect(@my_calculator.results).to eq(6)
  end
  it "should be valid number" do
    expect(@my_calculator.multiply("y")).to eq(false)
  end
end

describe "Division" do
  it "divide X to internal result value" do
    @my_calculator.divide(2)
    expect(@my_calculator.results).to eq(3)
  end
  it "should be valid number" do
    expect(@my_calculator.divide("y")).to eq(false)
  end
end

describe "Chain" do
  it "combine two operations" do
    @my_calculator.add(5).subtract(1)
    expect(@my_calculator.results).to eq(7)
  end
  it "combine three operations" do
    @my_calculator.add(5).subtract(1).multiply(1)
    expect(@my_calculator.results).to eq(11)
  end
  it "combine four operations" do
    @my_calculator.add(5).subtract(1).multiply(1).divide(5)
    expect(@my_calculator.results).to eq(3)
  end
end

describe "Operations" do
  it "perform add operations" do
    @my_calculator.operations('add',1)
    expect(@my_calculator.results).to eq(4)
  end
  it "perform subtract operations" do
    @my_calculator.operations('subtract',1)
    expect(@my_calculator.results).to eq(3)
  end
  it "perform multiply operations" do
    @my_calculator.operations('multiply',2)
    expect(@my_calculator.results).to eq(6)
  end
  it "perform divide operations" do
    @my_calculator.operations('',2)
    expect(@my_calculator.results).to eq(3)
  end
end

describe "Undo" do
  it "undo operations" do
    @my_calculator.undo
    expect(@my_calculator.results).to eq(6)
  end
  it "undo operations" do
    @my_calculator.undo
    expect(@my_calculator.results).to eq(3)
  end
end

describe "Redo" do
  it "redo operations" do
    @my_calculator.redo
    expect(@my_calculator.results).to eq(6)
  end
  it "redo should not happen if there are no other operations" do
    @my_calculator.redo
    @my_calculator.redo
    expect(@my_calculator.results).to eq(3)
  end

end

  # Tests go here

end
