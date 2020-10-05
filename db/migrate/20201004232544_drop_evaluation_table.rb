class DropEvaluationTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :evaluations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
