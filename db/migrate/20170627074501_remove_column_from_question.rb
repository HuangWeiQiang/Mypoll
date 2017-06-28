class RemoveColumnFromQuestion < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :answer_r, :string
    remove_column :questions, :answer_l, :string
    remove_column :questions, :image_r, :string
    remove_column :questions, :image_l, :string
    remove_column :questions, :count_r, :integer
    remove_column :questions, :count_l, :integer
  end
end
