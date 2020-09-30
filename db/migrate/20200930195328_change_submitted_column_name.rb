class ChangeSubmittedColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :submitted_texts, :instituction, :institution
    rename_column :translated_texts, :instituction, :institution
  end
end
