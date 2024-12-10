class PostsController < ApplicationController
    # Saltar la autenticación solo para las acciones index y show
    skip_before_action :authenticate_user!, only: [:index, :show]
  
    before_action :set_post, only: %i[show edit update destroy]
  
    def index
      @posts = Post.all
    end
  
    def show
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
  
      if @post.save
        redirect_to @post, notice: 'Post creado exitosamente.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post actualizado exitosamente.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @post.destroy
      redirect_to posts_path, notice: 'Post eliminado exitosamente.'
    end
  
    private
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
  end
  