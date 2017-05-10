require 'rails_helper'

RSpec.describe Slide, :type => :model do
  subject { described_class.new() }

  describe "Validations" do
    it "is valid with valid attributes"
    it "is invalid without a title"
    it "is invalid without a type"
  end
  
  describe "Associations" do
    it "has one slideshow"
    it "has many content"
  end
end
