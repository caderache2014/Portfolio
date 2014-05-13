class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  mount_uploader :image, ImageUploader
  def publish!
    published = true
    save!
  end
end
