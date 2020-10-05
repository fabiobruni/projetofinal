class ChangeColumnTypeStarsOnTranslated < ActiveRecord::Migration[6.0]
  def change
    change_column :translated_texts, :stars, :float
  end
end
