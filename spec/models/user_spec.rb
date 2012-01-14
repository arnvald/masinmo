require 'spec_helper'

describe User do

  before(:each) do
    @user = Factory(:user)
  end

  context "validations" do

    it "should have no errors" do
      @user.should be_valid
    end

    it "should check the uniqueness of username" do
      user2 = Factory.build(:user, username: @user.username)
      user2.should have(1).error_on :username
    end

    it "should not allow username longer than 64 chars" do
      @user.username = 'a'*13
      @user.should have(1).error_on :username
    end

    it "should not allow first_name longer than 64 chars" do
      @user.first_name = 'a'*65
      @user.should have(1).error_on :first_name
    end

    it "should not allow last_name longer than 64 chars" do
      @user.last_name = 'a'*65
      @user.should have(1).error_on :last_name
    end
  end

  describe "admin?" do
    before do
      @admin = Factory(:user, admin: true)
    end
    it "should give right answer" do
      @user.admin?.should be false
      @admin.admin?.should be true
    end
  end

end
