class CreateRarity < ActiveRecord::Migration
  def change
    create_table :rarities do |t|
      t.string :value
    end

    add_column :cards, :rarity_id, :integer

    remove_column :cards, :rarity, :string
  end
end
