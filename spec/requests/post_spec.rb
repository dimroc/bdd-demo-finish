require 'spec_helper'

feature "posts" do
  context "a user" do
    let(:user) { Fabricate(:user) }
    context "when logged in" do
      before { sign_in user }
      it "should be able to create a post", js: true do
        click_on "create post"

        title = Faker::Lorem.word
        content = Faker::Lorem.paragraph
        fill_in "post_title", with: title
        fill_in "post_content", with: content

        click_button "Create Post"

        page.current_path.should == post_path(Post.last)
        page.should have_content title
        page.should have_content content
      end
    end
  end
end
