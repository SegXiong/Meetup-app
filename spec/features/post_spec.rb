require 'rails_helper'

feature "post meetup", :type => :feature do
  before do
    @user = User.create!( :email => "Segue@gmail.com", :password => "123456")
    @post = Post.create!( :title => "chengdu meetup", :content => "blablablabla", :user => @user )
  end
  example "post failed" do
    visit "/posts/new"
    expect(page).to have_content("You need to sign in or sign up before continuing")
  end

  example "post successed" do
    visit "/posts/new"
    expect(page).to have_content("Log in")

    within("#new_user") do
      fill_in "Email Address", with: "Segue@gmail.com"
      fill_in "Password", with: "123456"
    end
    click_button "Log in"
    expect(page).to have_content("Signed in successfully")

    within("#new_post") do
      fill_in :post_title, with: "foo"
      fill_in :'post[content]', with: "bar"   # 2 ways
    end
    click_button "Submit"
    expect(page).to have_content("Create successed")
  end
end
