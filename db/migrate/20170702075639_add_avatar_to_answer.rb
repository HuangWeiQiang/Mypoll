class AddAvatarToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :avatar, :string
  end
end
