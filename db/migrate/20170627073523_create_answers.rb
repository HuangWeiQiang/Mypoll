class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :content
      t.string :image
      t.integer :count

      t.timestamps
    end
  end
end
