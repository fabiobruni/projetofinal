class AddEvaluationColumnToTranslatedText < ActiveRecord::Migration[6.0]
  def change
    add_column :translated_texts, :stars, :decimal
  end
end
