class CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
  
      if @comment.save
        redirect_to @post, notice: 'Comentario agregado exitosamente.'
      else
        redirect_to @post, alert: 'No se pudo agregar el comentario.'
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
  end
  