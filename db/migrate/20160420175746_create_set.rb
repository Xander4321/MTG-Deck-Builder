class CreateSet < ActiveRecord::Migration
  def change
    create_table :sets do |t|
      t.string :name, null: false
      t.text :symbol
      t.integer :total
    end

    add_column :cards, :set_id, :integer
  end
end
