require 'spec_helper'

describe PostsController do
  describe "#new" do
    it "should render the new page" do
      get :new
      response.should be_success
      assigns(:post).should_not be_nil
    end
  end

  describe "#show" do
    let(:fake_post) { Fabricate(:post) }
    it "should show the post" do
      get :show, id: fake_post.id
      response.should be_success
      assigns(:post).should == fake_post
      "12345".should have_content "123"
      # ap response.body
      response.should render_template(:show)
    end
  end

  describe "#create" do
    let(:fake_post) {Fabricate.build(:post) }
    it "should create the post" do
      params = { post: { title: fake_post.title, content: fake_post.content } }
      expect {
        post :create, params
        response.should be_redirect
      }.to change { Post.count }.by(1)
    end
  end
end
