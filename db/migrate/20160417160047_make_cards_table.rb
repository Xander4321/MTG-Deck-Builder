class MakeCardsTable < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.string :color_identity, null: false
      t.string :mana_cost
      t.integer :cmc, null: false
      t.string :rarity, null: false
      t.text :rules_text
      t.text :flavor_text
      t.integer :power
      t.integer :toughness
      t.integer :loyalty
      t.belongs_to :artist_id
      t.integer :number
      t.text :image
    end
  end
end
