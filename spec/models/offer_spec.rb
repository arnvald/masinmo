require 'spec_helper'

describe Offer do

  before(:each) do
    @user = Factory(:user)
    @offer = Factory(:offer, user: @user)
    @full_offer = Factory(:offer_publish_ready, user: @user)
  end

  it "should not validate other fields" do
    @offer.should have(:no).errors_on :country
    @offer.should have(:no).errors_on :city
    @offer.should have(:no).errors_on :street
    @offer.should have(:no).errors_on :price
    @offer.should have(:no).errors_on :kind
    @offer.should have(:no).errors_on :property_type
  end

  describe "when published" do
    before do
      @offer.state = "published"
      @full_offer.state = "published"
    end

    it "should show validation errors" do
      @offer.should have(1).error_on :country
      @offer.should have(1).error_on :city
      @offer.should have(1).error_on :street
      @offer.should have(1).error_on :price
      @offer.should have(1).error_on :property_type
    end
    
    it "should show no errors" do
      @full_offer.should have(:no).errors_on :country
      @full_offer.should have(:no).errors_on :city
      @full_offer.should have(:no).errors_on :street
      @full_offer.should have(:no).errors_on :price
      @full_offer.should have(:no).errors_on :kind
      @full_offer.should have(:no).errors_on :property_type
    end
  end

  describe "owned by" do
    it "should be owned only by its owner" do
      @offer.owned_by?(@user).should be true
      @offer.owned_by?(Factory(:user)).should be false
    end
  end

  describe "address for maps" do
    before do
    end

    it "should be empty" do
      @offer.gmaps4rails_address.should == ""
    end

    it "should be complete" do
      @full_offer.gmaps4rails_address.should == "Av. de Blasco Ibanez, Valencia, Spain"
    end
  end

  describe "changing state" do
    it "should publish the offer" do
      @full_offer.state.should == "draft"
      @full_offer.should_receive(:process_geocoding).and_return(true)
      @full_offer.publish!
      @full_offer.state.should == "published"
      @full_offer.expiry_date.should == Date.today + 2.weeks
    end

    it "should hide published offer" do
      @full_offer.publish!
      @full_offer.state.should == "published"
      @full_offer.hide!
      @full_offer.state.should == "draft"
    end
  end

  describe "state question" do
    it "should show the right answer" do
      @offer.state = "draft"
      @offer.draft?.should be true
      @offer.published?.should be false
      @offer.archived?.should be false

      @offer.state = "published"
      @offer.draft?.should be false
      @offer.published?.should be true
      @offer.archived?.should be false

      @offer.state = "archived"
      @offer.draft?.should be false
      @offer.published?.should be false
      @offer.archived?.should be true
    end
  end

  describe "geocoding" do
    it "shouldn't be geocoded while being saved" do
      @offer.should_not_receive(:process_geocoding)
      @offer.save
    end
  end
end
