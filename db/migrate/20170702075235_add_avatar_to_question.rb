class AddAvatarToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :avatar, :string
  end
end
