require 'rails_helper'

feature "post comment", :type => :feature do
  before do
    @user = User.create!( :email => "Segue@gmail.com", :password => "123456")
    @post = Post.create!( :title => "chengdu meetup", :content => "blablablabla", :user => @user )
    visit "/posts/new"
    expect(page).to have_content("Log in")
    within("#new_user") do
      fill_in "Email Address", with: "Segue@gmail.com"
      fill_in "Password", with: "123456"
    end
    click_button "Log in"
    expect(page).to have_content("Signed in successfully")
    visit "/posts/1"
  end

  example "comment failed" do
    click_button "Submit"
    expect(page).to have_content("Comment failed")
  end

  example "comment successed" do
    within("#new_comment") do
      fill_in :comment_content, with: "hello!"
    end
    click_button "Submit"
    expect(page).to have_content("Comment successed")
  end

end
