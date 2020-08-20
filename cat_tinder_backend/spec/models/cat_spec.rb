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

  it "should make sure age is a number" do
    cat = Cat.create(name:"Roscoe",age:"4",enjoys:"Long walks on the beach.")
    expect(cat.age).to_be a_number
  end
end
