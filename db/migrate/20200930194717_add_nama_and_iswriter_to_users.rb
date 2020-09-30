class AddNamaAndIswriterToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :is_writer, :boolean
  end
end
