class PostPolicy
  attr_accessor :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def publish?
    @user.editor?
  end

  def update?
    @user.editor? or not @post.published?
  end

  def destroy?
    @user.editor?
  end
 end