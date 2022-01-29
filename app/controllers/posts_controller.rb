class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = authorize policy_scope(Post).eager_load([:user]).page(params[:page])
  end

  def show; end

  def new
    @post = authorize Post.new
    skip_policy_scope
  end

  def edit; end

  def create
    @post = authorize Post.new(post_params.merge(user: current_user))
    skip_policy_scope

    if @post.save
      redirect_to @post, notice: notice_message(Post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: notice_message(Post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: notice_message(Post)
  end

  private

  def set_post
    @post = authorize policy_scope(Post).find_by!(hashid: params[:hashid])
  end

  def post_params
    params.require(:post).permit(:title, :content, :published)
  end
end
