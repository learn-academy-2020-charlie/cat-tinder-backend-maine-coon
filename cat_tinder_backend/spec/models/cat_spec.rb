require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate presence" do
    cat = Cat.create(age:4,enjoys:"Long walks on the beach.")
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate presence" do
    cat = Cat.create(name:"Roscoe",enjoys:"Long walks on the beach.")
    expect(cat.errors[:age]).to_not be_empty
  end

  it "should validate presence" do
    cat = Cat.create(name:"Roscoe",age:4)
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "should not allow an enjoys value shorter than 10 characters" do
    cat = Cat.create(name:"Roscoe",age:4,enjoys:"nothing!").should_not be_valid
    cat = Cat.create(name:"Roscoe",age:4,enjoys:"everything in the whole world.").should be_valid
  end
end
