class PostsController < ApplicationController

  def index
    #게시글을 모두 보여줄것
    #새글 쓰기 링크 보여줄것
    @posts = Post.all.reverse
  end

  def new
    #<form>을 통해 title, content -> /posts/create

  end

  def create

    Post.create(
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
end
