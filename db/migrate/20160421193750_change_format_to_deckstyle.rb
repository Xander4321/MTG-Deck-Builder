class ChangeFormatToDeckstyle < ActiveRecord::Migration
  def change
    rename_table :formats, :deckstyles

    rename_column :decks, :format_id, :deckstyle_id
  end
end
