class AddEvaluationTable < ActiveRecord::Migration[6.0]
    def change
    create_table :evaluations do |t|
      t.string :content
      t.float :stars
      t.references :user, null: false, foreign_key: true
      t.references :translated_text, null: false, foreign_key: true

      t.timestamps
    end
  end
end
