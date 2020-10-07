class AddColumnDraftToTranslated < ActiveRecord::Migration[6.0]
  def change
    add_column :translated_texts, :draft, :boolean
  end
end
