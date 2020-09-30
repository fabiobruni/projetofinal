class CreateSubmittedTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :submitted_texts do |t|
      t.string :url
      t.string :instituction
      t.date :deadline
      t.string :service_title
      t.text :service
      t.integer :target_public
      t.text :service_stages
      t.text :more_info

      t.timestamps
    end
  end
end
