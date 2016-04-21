class CreateDeck < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name, null: false
      t.belongs_to :format

      t.timestamps null:false
    end
  end
end
