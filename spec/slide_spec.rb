require 'rails_helper'

RSpec.describe Slide, :type => :model do
  subject { described_class.new(slide_type: "content", title: "sample title") }

  describe "Validations" do
    it "has a valid factory" do
      FactoryGirl.create(:slide).should be_valid
    end

    it "is invalid without a title" do
      FactoryGirl.build(:slide, title: "").should_not be_valid
    end

    it "is invalid without a type" do
      FactoryGirl.build(:slide, slide_type: "").should_not be_valid
    end

    it "is invalid without an approved type"
  end
  
  describe "Associations" do
    it { should belong_to(:slideshow) }
    #it { should have_many(:contents) }
  end
end

