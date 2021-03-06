#add to spec/models/idea_spec.rb
require 'spec_helper'

describe "creating Factory instances" do
  it "should succeed creating a new :idea from the Factory" do
    lambda { create(:idea) }.should_not raise_error
  end

  it "should be an instance of Idea" do
    create(:idea).should be_a_kind_of Idea
  end

  it "should be a valid Idea" do
    create(:idea).should be_valid
  end

  describe "validations" do
    #after using shoulda library
    subject { create(:idea) } #subject establishes the object inside the test
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:description) } 
  end

  describe "name uniqueness" do
    let(:idea) {create(:idea) }  #created a variable idea which is equal to the one created for testing
    it "should require a unique value for name" do
      idea2 = Idea.new(:name => idea.name)
      idea2.should_not be_valid
    end
  end

  #associations#
  describe "associations" do
    subject { create(:idea) }
    it { should have_many(:tasks) }
  end

  #scopes#
  describe "scopes" do
    let(:idea) { create(:idea) } 
    
    it "should return an Idea with the requested range" do
      idea.update_attribute(:range, 8)
      Idea.ranged(8).include?(idea).should be true
    end
    
    it "should not raise an error if passed nil" do
      lambda { Idea.ranged(nil) }.should_not raise_error  #to do error testing need to use lambda block
    end

    it "should not return an Idea with a different range" do
      idea.update_attribute(:range, 8)
      Idea.ranged(4).include?(idea).should be false
    end
 
 end

end
