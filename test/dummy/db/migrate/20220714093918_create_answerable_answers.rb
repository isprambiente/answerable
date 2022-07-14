class CreateAnswerableAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answerable_answers do |t|
      t.references :answerable, polymorphic: true, null: false
      t.references :answerable_question, null: false, foreign_key: true
      t.text :value, null: false, default: ''

      t.timestamps
    end
  end
end
