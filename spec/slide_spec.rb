require 'rails_helper'

RSpec.describe Slide, :type => :model do
  subject { described_class.new(slide_type: "content", title: "sample title") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a type" do
      subject.slide_type = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without an approved type"
  end
  
  describe "Associations" do
    it "has one slideshow"
    it "has many content"
  end
end
