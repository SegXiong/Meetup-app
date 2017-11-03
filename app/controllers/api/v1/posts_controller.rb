class Api::V1::PostsController < ApiController

  def index
    @posts = Post.all
    render :json => {
      :data => @posts.map{ |post|
        {
          :title => post.title,
          :intro => post.content
        }
      }
    }
  end
end
