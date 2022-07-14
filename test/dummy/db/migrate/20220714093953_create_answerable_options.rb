class CreateAnswerableOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :answerable_options do |t|
      t.references :answerable_question, null: false, foreign_key: true
      t.text :value
      t.integer :weight, null: false, default: 0

      t.timestamps
    end
  end
end
