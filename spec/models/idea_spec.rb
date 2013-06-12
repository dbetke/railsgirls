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

end
