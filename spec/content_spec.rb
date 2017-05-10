require 'rails_helper'

RSpec.describe Content, :type => :model do

  describe "Validations" do
    it "has a valid factory" do
      FactoryGirl.create(:content).should be_valid
    end
    #The body property is always valid so there's no test here for that
  end
  
  describe "Associations" do
    it { should belong_to(:slide) }
  end
end

