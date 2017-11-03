class Api::V1::PostsController < ApiController

  def index
    @posts = Post.all
    render :json => {
      :data => @posts.map{ |post|
        {
          :title => post.title,
          :intro => post.content,
          :author => post.user_id,
          :created_at => post.created_at
        }
      }
    }
  end
end
