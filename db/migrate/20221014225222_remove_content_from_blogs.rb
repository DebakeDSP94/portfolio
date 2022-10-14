class RemoveContentFromBlogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :content, :text
  end
end
