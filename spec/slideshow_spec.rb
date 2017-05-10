require 'rails_helper'

RSpec.describe Slideshow, :type => :model do

  describe "Validations" do
    it "has a valid factory" do
      FactoryGirl.create(:slideshow).should be_valid
    end

    it "is not valid without a title" do 
      FactoryGirl.build(:slideshow, title: "").should_not be_valid
      #subject.title = nil
      #expect(subject).to_not be_valid
    end

    it "is not valid without slides"
  end

  describe "Associations" do
    #it "has many slides" do
      #assc = FactoryGirl.create(:slideshow).reflect_on_association(:slide)
      #expect(assc.macro).to eq :has_many

    #end
    it { should have_many(:slides) }
  end
end
