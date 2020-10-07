class SetDefaultValueToDraft < ActiveRecord::Migration[6.0]
  def change
    change_column_default :translated_texts, :draft, true
  end
end
