class Comment < ActiveRecord::Base
   belongs_to :author, class_name: "User"
  validates :context, presence: true,
  						:length => {:within => 5..500}
  belongs_to :commentable, polymorphic: true

  def approve!
    approved = true
    save!
  end
end
