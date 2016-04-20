class RenameSets < ActiveRecord::Migration
  def change
    rename_table :sets, :expantions

    rename_column :cards, :set_id, :expantion_id
  end
end
