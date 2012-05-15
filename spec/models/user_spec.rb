require 'spec_helper'

describe User do
  describe "fabricators" do
    context "#user" do
      it { Fabricate.build(:user).should be_valid }
    end
  end
end
