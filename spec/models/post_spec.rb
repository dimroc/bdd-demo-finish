require 'spec_helper'

describe Post do
  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :content}
  end

  describe "fabricators" do
    context "#post" do
      subject { Fabricate.build(:post) }
      it { should be_valid }
    end
  end
end
