require 'rails_helper'

RSpec.describe Slide, :type => :model do

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

    it "is invalid without an approved type" do
      FactoryGirl.build(:slide, slide_type: "five-content").should_not be_valid
      FactoryGirl.build(:slide, slide_type: "title").should be_valid
      FactoryGirl.build(:slide, slide_type: "content").should be_valid
      FactoryGirl.build(:slide, slide_type: "two-column").should be_valid
    end
  end
  
  describe "Associations" do
    it { should belong_to(:slideshow) }
    it { should have_many(:contents).dependent(:destroy) }
  end
end

