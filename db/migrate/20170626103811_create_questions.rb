class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :answer_r
      t.string :answer_l
      t.string :image_r
      t.string :image_l
      t.integer :count_r, default: 0
      t.integer :count_l, default: 0
      t.integer :star, default: 0
      t.string :content
      t.integer :state
      t.integer :category_id

      t.timestamps
    end
  end
end
