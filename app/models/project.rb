class Project < ActiveRecord::Base
  validates :technologies_used, presence: true
  validates :name, length: {in: 4..255 }
  belongs_to :author, class_name: "User"
  mount_uploader :image, ImageUploader
  has_many :comments, as: :commentable
  has_attached_file :image
end
