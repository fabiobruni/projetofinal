class ChangeColumnTypeStarsOnTranslatedAgain < ActiveRecord::Migration[6.0]
  def change
    change_column :translated_texts, :stars, :integer
  end
end
