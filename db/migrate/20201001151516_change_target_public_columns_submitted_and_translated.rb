class ChangeTargetPublicColumnsSubmittedAndTranslated < ActiveRecord::Migration[6.0]
  def change
    change_column :submitted_texts, :target_public, :text
    change_column :translated_texts, :target_public, :text
    add_column :submitted_texts, :potential_public, :integer
    add_column :translated_texts, :potential_public, :integer  end
end
