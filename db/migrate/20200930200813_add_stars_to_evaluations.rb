class AddStarsToEvaluations < ActiveRecord::Migration[6.0]
  def change
    add_column :evaluations, :stars, :integer
  end
end
