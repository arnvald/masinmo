require 'spec_helper'

describe User do

  before(:each) do
    @user = Factory(:user)
    @admin = Factory(:user, admin: true)
  end

  describe "admin?" do
    it "should give right answer" do
      @user.admin?.should be false
      @admin.admin?.should be true
    end
  end

end
