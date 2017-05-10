require 'rails_helper'

RSpec.describe Slideshow, :type => :model do
  subject { described_class.new(title: "A Title") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a title" do 
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without slides"
  end

  describe "Associations" do
    it "has many slides"
  end

end
