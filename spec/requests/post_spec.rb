require 'rails_helper'

RSpec.describe "API_V1::Posts", :type => :request do
  before do
    @user = User.create!( :email => "segue@gmail.com", :password => "123456" )
    @post1 = Post.create!( :title => "chengdu meetup", :content => "123blah321", :user_id => @user.id )
    @post2 = Post.create!( :title => "shenzhen meetup", :content => "321blah123", :user_id => @user.id )
  end

  example "GET /api/v1/posts" do
    get "/api/v1/posts"
    expect(response).to have_http_status(200)

    expected_result = {
      "data": [
        {
          "title": @post1.title,
          "intro": @post1.content,
          "author": @post1.user_id,
          "created_at": @post1.created_at
        },
        {
          "title": @post2.title,
          "intro": @post2.content,
          "author": @post2.user_id,
          "created_at": @post2.created_at
        }
      ]
    }
    expect(response.body).to eq(expected_result.to_json)
  end
end
