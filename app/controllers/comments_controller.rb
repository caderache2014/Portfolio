class CommentsController < ApplicationController
   before_filter :load_commentable
   def index
    @post = Post.find(params[:post_id])
    @project = Project.find(project_params)
    @comments = @commentable.comments
   end

  def new
    @post = Post.find(params[:post_id])
    @comment = @commentable.comments.new
    authorize @comment
  end
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.author = current_user
    if @comment.save
      redirect_to @commentable, notice: "Successfully saved comment"
    else
      render :new
      #instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      #render template: "#{@resource}/show"
    end
  end
  def update
    @comment = Comment.find(params[:id])
    @comment.approve!
    if @comment.update(comment_params)
      redirect_to @commentable, notice: 'Successfully approved comment'
    else
      redirect_to @commentable, notice: "Error approving comment"
    end
  end
  def show
    @comments = @commentable.comments
    @post = Post.find(params[:post_id])
    @project = Project.find(project_params)
    @comment = @commentable.comments.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @comment }
    end
  end

  def destroy
    set_comment
    if @comment.destroy
      redirect_to @commentable, notice: "Deleted comment"
    else
      redirect_to @commentable, notice: "Error deleting comment"
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @commentable.comments.find(params[:id])
  end


  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:context, :approved, :created_at, :updated_at, :commentable_id, :commentable_type, :author)
  #if CommentPolicy.new(current_user, @comment).approver?)
  end

  def load_commentable
   # @resource, id = request.path.split('/')[1,2]
   # @commentable = @resource.singularize.classify.constantize.find(id)
   klass = [Post, Project].detect { |c| params["#{c.name.underscore}_id"]}
   @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
