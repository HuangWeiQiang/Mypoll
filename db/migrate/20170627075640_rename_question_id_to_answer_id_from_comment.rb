class RenameQuestionIdToAnswerIdFromComment < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :question_id, :answer_id
  end
end
