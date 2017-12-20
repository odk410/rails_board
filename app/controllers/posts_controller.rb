class PostsController < ApplicationController

  before_action :authorize

  def index
    #게시글을 모두 보여줄것
    #새글 쓰기 링크 보여줄것
    @posts = Post.all.reverse
  end

  def show
      # /posts/show/1 => 1번 글만 보여준다.
      @post = Post.find(params[:id])
  end

  def new
    #<form>을 통해 title, content -> /posts/create

  end

  def create

    Post.create(
      #현재접속한 유저의 아이디
      user_id: current_user.id,
      title: params[:title],
      content: params[:content]
    )

    redirect_to '/'
  end

  def destroy
    # 데이터베이스에서 우리가 삭제하고자 하는 글을 찾는다.
    # 해당하는 글을 삭제한다.
    # :id를 통해 지우고 싶은 Post를 찾는다.
    # 찾은 Post를 지운다.
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # :id를 통해 Post를 찾는다.
    # 그걸 업데이트해준다.
    post = Post.find(params[:id])
    post.update(
      title: params[:title],
      content: params[:content]
    )
    redirect_to '/'
  end

  def add_comment
    Comment.create(
      user_id: current_user.id,
      content: params[:content],
      post_id: params[:id]
    )
    # 댓글 작성하고 원래 작성하던 페이지로 가는 것 show를 사용하려면 아이디를 또 받아와야 하기 때문에 귀찮다
    # redirect_to "/posts/show/#{params[:id]}"
    redirect_to :back
  end

end
