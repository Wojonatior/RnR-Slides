require 'rails_helper'

RSpec.describe Slideshow, :type => :model do

  describe "Validations" do
    it "has a valid factory" do
      FactoryGirl.create(:slideshow).should be_valid
    end

    it "is not valid without a title" do 
      FactoryGirl.build(:slideshow, title: "").should_not be_valid
    end

    it "is not valid without slides"
  end

  describe "Associations" do
    it { should have_many(:slides) }
  end
end
