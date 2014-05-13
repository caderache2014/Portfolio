class AddAuthoridToComments < ActiveRecord::Migration
  def change
    add_column :comments, :authorid, :integer
  end
end
