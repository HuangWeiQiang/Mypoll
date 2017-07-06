class ChangeAnswerCount < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :answers do |t|
        dir.up {t.change :count, :integer, default: 0}
        dir.down {t.change :count, :integer}
      end
    end
  end
end
