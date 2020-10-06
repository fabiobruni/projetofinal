class EraseColumnStarsFromTranslated < ActiveRecord::Migration[6.0]
  def change
    remove_column :translated_texts, :stars
  end
end
