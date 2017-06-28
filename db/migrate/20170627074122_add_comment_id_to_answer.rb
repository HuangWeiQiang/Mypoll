class AddCommentIdToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :comment_id, :string
  end
end
