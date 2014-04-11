class Comment < ActiveRecord::Base
  belongs_to :commentabe, polymorphic: true

  def approve!
    approved = true
    save!
  end
end
