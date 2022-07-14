class CreateAnswerableQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :answerable_questions do |t|
      t.references :questionable, polymorphic: true, null: false
      t.text :title, null: false, default: ''
      t.text :note, null: false, default: ''
      t.integer :type, null: false, default: 0
      t.integer :weight, null: false, default: 0
      t.boolean :mandatory, null: false, default: true

      t.timestamps
    end
    add_index :answerable_questions, :weight
  end
end
