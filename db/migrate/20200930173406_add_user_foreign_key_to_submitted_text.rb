class AddUserForeignKeyToSubmittedText < ActiveRecord::Migration[6.0]
  def change
    add_reference :submitted_texts, :user, index: true
  end
end
